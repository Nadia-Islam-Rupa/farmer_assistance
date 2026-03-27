import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../models/fertilizer_tips_request_model.dart';
import '../models/fertilizer_tips_response_model.dart';
import '../repositories/fertilizer_tips_repository.dart';

@injectable
class FertilizerTipsUseCase {
  final FertilizerTipsRepository _fertilizerTipsRepository;

  FertilizerTipsUseCase(this._fertilizerTipsRepository);

  Future<Either<Failures, FertilizerTipsResponseModel>> call(
    FertilizerTipsRequestModel fertilizerTipsRequestData,
  ) async => await _fertilizerTipsRepository.fetchFertilizerTips(
    fertilizerTipsRequestData,
  );
}
