import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../models/smart_irrigation_request_model.dart';
import '../models/smart_irrigation_response_model.dart';

abstract class SmartIrrigationRepository {
  Future<Either<Failures, SmartIrrigationResponseModel>> predictIrrigation(
    SmartIrrigationRequestModel requestData
  );
}
