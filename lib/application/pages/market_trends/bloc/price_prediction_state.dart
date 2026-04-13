part of 'price_prediction_bloc.dart';

@freezed
class PricePredictionState with _$PricePredictionState {
  const factory PricePredictionState.initial() = _Initial;
  const factory PricePredictionState.loading() = LoadingPricePredictionState;
  const factory PricePredictionState.loaded({
    required PricePredictionResponseModel data,
  }) = LoadedPricePredictionState;
  const factory PricePredictionState.error({required String message}) =
      ErrorPricePredictionState;
}
