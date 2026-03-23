import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:farmer_assistance/domain/repositories/crop_disease_detection_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../models/Crop_disease_model.dart';

@injectable
class CropDiseaseUseCase {
  final CropDiseaseDetectionRepository _cropDiseaseDetectionRepository;

  CropDiseaseUseCase(this._cropDiseaseDetectionRepository);

  Future<Either<Failures, CropDiseaseModel>> call(File imageFile) async {
    return await _cropDiseaseDetectionRepository.detectCropDisease(imageFile);
  }
}
