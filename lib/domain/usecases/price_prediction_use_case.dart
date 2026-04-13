import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../models/price_prediction_request_model.dart';
import '../models/price_prediction_response_model.dart';
import '../repositories/price_prediction_repository.dart';

@injectable
class PricePredictionUseCase {
  final PricePredictionRepository _pricePredictionRepository;

  PricePredictionUseCase(this._pricePredictionRepository);

  Future<Either<Failures, PricePredictionResponseModel>> call(
    PricePredictionRequestModel requestData,
  ) async =>
      await _pricePredictionRepository.predictPrice(requestData);
}
