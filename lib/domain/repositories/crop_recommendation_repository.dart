import 'package:dartz/dartz.dart';
import 'package:farmer_assistance/domain/models/Crop_recommendation_request_model.dart';
import 'package:farmer_assistance/domain/models/Crop_recommendation_response_model.dart';

import '../failures/failures.dart';

abstract class CropRecommendationRepository {
  Future<Either<Failures, CropRecommendationResponseModel>>
  getCropRecommendation(
    CropRecommendationRequestModel cropRecommendationRequestModel,
  );
}
