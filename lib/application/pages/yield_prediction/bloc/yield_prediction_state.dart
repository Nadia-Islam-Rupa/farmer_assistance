part of 'yield_prediction_bloc.dart';

@freezed
class YieldPredictionState with _$YieldPredictionState {
  const factory YieldPredictionState.initial() = _Initial;
  const factory YieldPredictionState.loading() = LoadingYieldPredictionState;
  const factory YieldPredictionState.loaded({
    required YieldEstimationResponseModel data,
  }) = LoadedYieldPredictionState;
  const factory YieldPredictionState.error({required String message}) =
      ErrorYieldPredictionState;
}
