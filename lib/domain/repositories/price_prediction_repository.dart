import 'package:dartz/dartz.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';

import '../models/price_prediction_request_model.dart';
import '../models/price_prediction_response_model.dart';

abstract class PricePredictionRepository {
  Future<Either<Failures, PricePredictionResponseModel>> predictPrice(
    PricePredictionRequestModel requestData,
  );
}
