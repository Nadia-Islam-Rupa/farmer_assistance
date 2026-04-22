import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/data/datasources/remote_datasource/api_service.dart.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/price_prediction_request_model.dart';
import 'package:farmer_assistance/domain/models/price_prediction_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/failures/dio_error.dart';
import '../../domain/repositories/price_prediction_repository.dart';

@Injectable(as: PricePredictionRepository)
class PricePredictionRepositoryImpl extends PricePredictionRepository {
  final ApiService _apiService;
  final SupabaseClient _supabaseClient;

  PricePredictionRepositoryImpl(this._apiService, this._supabaseClient);

  @override
  Future<Either<Failures, PricePredictionResponseModel>> predictPrice(
    PricePredictionRequestModel requestData,
  ) async {
    try {
      final response = await _apiService.predictPrice(
        pricePredictionRequestData: requestData,
      );

      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId != null) {
        await _supabaseClient.from('price_predictions').insert({
          'user_id': userId,
          'admin1': requestData.admin1,
          'admin2': requestData.admin2,
          'market': requestData.market,
          'latitude': requestData.latitude,
          'longitude': requestData.longitude,
          'category': requestData.category,
          'commodity': requestData.commodity,
          'unit': requestData.unit,
          'pricetype': requestData.pricetype,
          'priceflag': requestData.priceflag,
          'date': requestData.date,
          'predicted_price': response.predictedPrice,
          'currency': response.currency,
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
