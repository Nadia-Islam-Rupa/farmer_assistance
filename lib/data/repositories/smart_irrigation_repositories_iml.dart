import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/smart_irrigation_request_model.dart';
import 'package:farmer_assistance/domain/models/smart_irrigation_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/failures/dio_error.dart';
import '../../domain/repositories/smart_irrigation_repository.dart';
import '../datasources/remote_datasource/api_service.dart.dart';

@Injectable(as: SmartIrrigationRepository)
class SmartIrrigationRepositoriesIml extends SmartIrrigationRepository {
  final ApiService _apiService;
  final SupabaseClient _supabaseClient;

  SmartIrrigationRepositoriesIml(this._apiService, this._supabaseClient);

  @override
  Future<Either<Failures, SmartIrrigationResponseModel>> predictIrrigation(
    SmartIrrigationRequestModel requestData,
  ) async {
    try {
      final response = await _apiService.smartIrrigation(
        smartIrrigationRequestData: requestData,
      );

      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId != null) {
        await _supabaseClient.from('smart_irrigation').insert({
          'user_id': userId,
          'crop_id': requestData.cropId,
          'soil_type': requestData.soilType,
          'seedling_stage': requestData.seedlingStage,
          'moisture': requestData.moi,
          'temperature': requestData.temp,
          'humidity': requestData.humidity,
          'irrigation_needed': response.irrigationNeeded,
          'recommendation': response.recommendation,
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
