import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../models/smart_irrigation_request_model.dart';
import '../models/smart_irrigation_response_model.dart';
import '../repositories/smart_irrigation_repository.dart';

@injectable
class SmartIrrigationUseCase {
  final SmartIrrigationRepository _smartIrrigationRepository;

  SmartIrrigationUseCase(this._smartIrrigationRepository);

  Future<Either<Failures, SmartIrrigationResponseModel>> call(
    SmartIrrigationRequestModel requestData,
  ) async => await _smartIrrigationRepository.predictIrrigation(requestData);
}
