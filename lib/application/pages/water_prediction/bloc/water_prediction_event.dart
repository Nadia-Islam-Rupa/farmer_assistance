part of 'water_prediction_bloc.dart';

@freezed
abstract class WaterPredictionEvent with _$WaterPredictionEvent {
  const factory WaterPredictionEvent.started({required SmartIrrigationRequestModel data}) = _Started;
}
