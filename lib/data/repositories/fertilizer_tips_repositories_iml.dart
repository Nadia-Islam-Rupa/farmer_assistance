import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/data/datasources/remote_datasource/api_service.dart.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/fertilizer_tips_request_model.dart';
import 'package:farmer_assistance/domain/models/fertilizer_tips_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/failures/dio_error.dart';
import '../../domain/repositories/fertilizer_tips_repository.dart';

@Injectable(as: FertilizerTipsRepository)
class FertilizerTipsRepositoriesIml extends FertilizerTipsRepository {
  final ApiService _apiService;
  final SupabaseClient _supabaseClient;

  FertilizerTipsRepositoriesIml(this._apiService, this._supabaseClient);

  @override
  Future<Either<Failures, FertilizerTipsResponseModel>> fetchFertilizerTips(
    FertilizerTipsRequestModel fertilizerTipsRequestData,
  ) async {
    try {
      final response = await _apiService.fertilizerTips(
        fertilizerTipsRequestData: fertilizerTipsRequestData,
      );

      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId != null) {
        await _supabaseClient.from('fertilizer_tips').insert({
          'user_id': userId,
          'crop': fertilizerTipsRequestData.crop,
          'soil_color': fertilizerTipsRequestData.soilColor,
          'temperature': fertilizerTipsRequestData.temperature,
          'nitrogen': fertilizerTipsRequestData.nitrogen,
          'potassium': fertilizerTipsRequestData.potassium,
          'phosphorus': fertilizerTipsRequestData.phosphorus,
          'rainfall': fertilizerTipsRequestData.rainfall,
          'ph': fertilizerTipsRequestData.ph,
          'fertilizer': response.fertilizer,
          'confidence': response.confidence,
          'feature_importance': response.featureImportance?.toJson(),
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
