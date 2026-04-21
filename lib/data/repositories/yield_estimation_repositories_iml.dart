import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/data/datasources/remote_datasource/api_service.dart.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/yield_estimation_request_model.dart';
import 'package:farmer_assistance/domain/models/yield_estimation_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/failures/dio_error.dart';
import '../../domain/repositories/yield_estimation_repository.dart';

@Injectable(as: YieldEstimationRepository)
class YieldEstimationRepositoriesIml extends YieldEstimationRepository {
  final ApiService _apiService;
  final SupabaseClient _supabaseClient;

  YieldEstimationRepositoriesIml(this._apiService, this._supabaseClient);

  @override
  Future<Either<Failures, YieldEstimationResponseModel>> estimateYield(
    YieldEstimationRequestModel requestData,
  ) async {
    try {
      final response = await _apiService.estimateYield(
        yieldEstimationRequestData: requestData,
      );

      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId != null) {
        await _supabaseClient.from('yield_estimations').insert({
          'user_id': userId,
          'item': requestData.item,
          'area': requestData.area,
          'rainfall': requestData.rainfall,
          'temperature': requestData.temperature,
          'pesticides': requestData.pesticides,
          'predicted_yield': response.predictedYield,
          'yield_unit': response.yieldUnit,
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
