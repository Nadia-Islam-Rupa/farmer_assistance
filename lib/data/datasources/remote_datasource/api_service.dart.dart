import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer_assistance/domain/models/Crop_disease_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<CropDiseaseModel> detectCropDisease(FormData formData) async {
    // final formData = FormData.fromMap({
    //   'image': await MultipartFile.fromFile(
    //     imageFile.path,
    //     filename: imageFile.path.split('/').last,
    //   ),
    // });

    final response = await dio.post(
      '/crop-disease/detect',
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to detect crop disease.');
    }

    return CropDiseaseModel.fromJson(response.data);
  }
}
