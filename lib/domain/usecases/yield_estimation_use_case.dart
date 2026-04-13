import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../models/yield_estimation_request_model.dart';
import '../models/yield_estimation_response_model.dart';
import '../repositories/yield_estimation_repository.dart';

@injectable
class YieldEstimationUseCase {
  final YieldEstimationRepository _yieldEstimationRepository;

  YieldEstimationUseCase(this._yieldEstimationRepository);

  Future<Either<Failures, YieldEstimationResponseModel>> call(
    YieldEstimationRequestModel requestData,
  ) async => await _yieldEstimationRepository.estimateYield(requestData);
}
