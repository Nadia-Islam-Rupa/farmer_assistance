import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/smart_irrigation_request_model.dart';
import 'package:farmer_assistance/domain/models/smart_irrigation_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures/dio_error.dart';
import '../../domain/repositories/smart_irrigation_repository.dart';
import '../datasources/remote_datasource/api_service.dart.dart';

@Injectable(as: SmartIrrigationRepository)
class SmartIrrigationRepositoriesIml extends SmartIrrigationRepository {
  final ApiService _apiService;

  SmartIrrigationRepositoriesIml(this._apiService);

  @override
  Future<Either<Failures, SmartIrrigationResponseModel>> predictIrrigation(
    SmartIrrigationRequestModel requestData,
  ) async {
    try {
      final response = await _apiService.smartIrrigation(
        smartIrrigationRequestData: requestData,
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
