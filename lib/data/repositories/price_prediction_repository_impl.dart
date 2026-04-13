import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/data/datasources/remote_datasource/api_service.dart.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/price_prediction_request_model.dart';
import 'package:farmer_assistance/domain/models/price_prediction_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures/dio_error.dart';
import '../../domain/repositories/price_prediction_repository.dart';

@Injectable(as: PricePredictionRepository)
class PricePredictionRepositoryImpl extends PricePredictionRepository {
  final ApiService _apiService;

  PricePredictionRepositoryImpl(this._apiService);

  @override
  Future<Either<Failures, PricePredictionResponseModel>> predictPrice(
    PricePredictionRequestModel requestData,
  ) async {
    try {
      final response = await _apiService.predictPrice(
        pricePredictionRequestData: requestData,
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
