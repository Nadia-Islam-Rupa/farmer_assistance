import 'package:dartz/dartz.dart';
import 'package:farmer_assistance/domain/repositories/crop_recommendation_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../models/Crop_recommendation_request_model.dart';
import '../models/Crop_recommendation_response_model.dart';

@injectable
class CropRecommendationUseCase {
  final CropRecommendationRepository cropRecommendationRepository;

  CropRecommendationUseCase(this.cropRecommendationRepository);

  Future<Either<Failures, CropRecommendationResponseModel>> call(
    CropRecommendationRequestModel cropRecommendationRequestModel,
  ) async => await cropRecommendationRepository.getCropRecommendation(
    cropRecommendationRequestModel,
  );
}
