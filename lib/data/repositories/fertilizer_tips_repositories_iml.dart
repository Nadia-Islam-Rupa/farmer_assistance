import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmer_assistance/data/datasources/remote_datasource/api_service.dart.dart';

import 'package:farmer_assistance/domain/failures/failures.dart';

import 'package:farmer_assistance/domain/models/fertilizer_tips_request_model.dart';

import 'package:farmer_assistance/domain/models/fertilizer_tips_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures/dio_error.dart';
import '../../domain/repositories/fertilizer_tips_repository.dart';

@Injectable(as: FertilizerTipsRepository)
class FertilizerTipsRepositoriesIml extends FertilizerTipsRepository {
  final ApiService _apiService;
  FertilizerTipsRepositoriesIml(this._apiService);

  @override
  Future<Either<Failures, FertilizerTipsResponseModel>> fetchFertilizerTips(
    FertilizerTipsRequestModel fertilizerTipsRequestData,
  ) async {
    try {
      final response = await _apiService.fertilizerTips(
        fertilizerTipsRequestData: fertilizerTipsRequestData,
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
