part of 'water_prediction_bloc.dart';

@freezed
class WaterPredictionState with _$WaterPredictionState {
  const factory WaterPredictionState.initial() = _Initial;
  const factory WaterPredictionState.loading() = LoadingWaterPredictionState;
  const factory WaterPredictionState.loaded({required SmartIrrigationResponseModel data}) = LoadedWaterPredictionState;
  const factory WaterPredictionState.error({required String message}) = ErrorWaterPredictionState;

}
