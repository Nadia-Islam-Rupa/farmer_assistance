import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/Crop_recommendation_request_model.dart';
import 'package:farmer_assistance/domain/models/Crop_recommendation_response_model.dart';
import 'package:farmer_assistance/domain/repositories/crop_recommendation_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures/dio_error.dart';
import '../datasources/remote_datasource/api_service.dart.dart';

@Injectable(as: CropRecommendationRepository)
class CropRecommendationRepositoriesIml extends CropRecommendationRepository {
  final ApiService _apiService;
  CropRecommendationRepositoriesIml(this._apiService);

  @override
  Future<Either<Failures, CropRecommendationResponseModel>>
  getCropRecommendation(
    CropRecommendationRequestModel cropRecommendationRequestModel,
  ) async {
    try {
      final response = await _apiService.getCropRecommendation(
        cropRecommendationRequestModel: cropRecommendationRequestModel,
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(GeneralFailure(handleDioError(e)));
      }
      return left(GeneralFailure("Unexpected error occurred."));
    }
  }
}
