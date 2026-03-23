import 'dart:io';

import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../models/Crop_disease_model.dart';

abstract class CropDiseaseDetectionRepository {
  Future<Either<Failures, CropDiseaseModel>> detectCropDisease(File imageFile);
}
