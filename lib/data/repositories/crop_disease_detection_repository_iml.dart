import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/Crop_disease_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures/dio_error.dart';
import '../../domain/repositories/crop_disease_detection_repository.dart';
import '../datasources/remote_datasource/api_service.dart.dart';

@Injectable(as: CropDiseaseDetectionRepository)
class CropDiseaseDetectionRepositoryIml extends CropDiseaseDetectionRepository {
  final ApiService _apiService;

  CropDiseaseDetectionRepositoryIml(this._apiService);

  @override
  Future<Either<Failures, CropDiseaseModel>> detectCropDisease(
    File imageFile,
  ) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });

      final response = await _apiService.detectCropDisease(formData);

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(GeneralFailure(handleDioError(e)));
      }
      return left(GeneralFailure("Unexpected error occurred."));
    }
  }
}
