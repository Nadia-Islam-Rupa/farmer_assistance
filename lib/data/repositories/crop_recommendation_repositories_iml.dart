import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/Crop_recommendation_request_model.dart';
import 'package:farmer_assistance/domain/models/Crop_recommendation_response_model.dart';
import 'package:farmer_assistance/domain/repositories/crop_recommendation_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/failures/dio_error.dart';
import '../datasources/remote_datasource/api_service.dart.dart';

@Injectable(as: CropRecommendationRepository)
class CropRecommendationRepositoriesIml extends CropRecommendationRepository {
  final ApiService _apiService;
  final SupabaseClient _supabaseClient;

  CropRecommendationRepositoriesIml(this._apiService, this._supabaseClient);

  @override
  Future<Either<Failures, CropRecommendationResponseModel>>
  getCropRecommendation(
    CropRecommendationRequestModel cropRecommendationRequestModel,
  ) async {
    try {
      final response = await _apiService.getCropRecommendation(
        cropRecommendationRequestModel: cropRecommendationRequestModel,
      );

      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId != null) {
        await _supabaseClient.from('crop_recommendations').insert({
          'user_id': userId,
          'nitrogen': cropRecommendationRequestModel.nitrogen,
          'phosphorus': cropRecommendationRequestModel.phosphorus,
          'potassium': cropRecommendationRequestModel.potassium,
          'temperature': cropRecommendationRequestModel.temperature,
          'humidity': cropRecommendationRequestModel.humidity,
          'ph': cropRecommendationRequestModel.ph,
          'rainfall': cropRecommendationRequestModel.rainfall,
          'crop': response.crop,
          'confidence': response.confidence,
        });
      }

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(GeneralFailure(handleDioError(e)));
      }
      return left(GeneralFailure("Unexpected error occurred."));
    }
  }
}
