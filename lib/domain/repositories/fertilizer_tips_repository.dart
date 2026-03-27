import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../models/fertilizer_tips_request_model.dart';
import '../models/fertilizer_tips_response_model.dart';

abstract class FertilizerTipsRepository {
  Future<Either<Failures, FertilizerTipsResponseModel>> fetchFertilizerTips(
    FertilizerTipsRequestModel fertilizerTipsRequestData,
  );
}
