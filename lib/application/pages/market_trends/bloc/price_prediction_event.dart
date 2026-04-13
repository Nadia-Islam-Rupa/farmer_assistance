part of 'price_prediction_bloc.dart';

@freezed
abstract class PricePredictionEvent with _$PricePredictionEvent {
  const factory PricePredictionEvent.started({
    required PricePredictionRequestModel data,
  }) = _Started;
}
