part of 'yield_prediction_bloc.dart';

@freezed
abstract class YieldPredictionEvent with _$YieldPredictionEvent {
  const factory YieldPredictionEvent.started({
    required YieldEstimationRequestModel data,
  }) = _Started;
}
