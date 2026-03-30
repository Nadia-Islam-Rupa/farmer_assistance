import 'package:dartz/dartz.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';

import '../models/yield_estimation_request_model.dart';
import '../models/yield_estimation_response_model.dart';

abstract class YieldEstimationRepository {
  Future<Either<Failures, YieldEstimationResponseModel>> estimateYield(
    YieldEstimationRequestModel requestData,
  );
}
