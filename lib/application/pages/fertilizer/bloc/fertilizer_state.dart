part of 'fertilizer_bloc.dart';

@freezed
class FertilizerState with _$FertilizerState {
  const factory FertilizerState.initial() = _Initial;
  const factory FertilizerState.loading() = LoadingFertilizerState;
  const factory FertilizerState.loaded({required FertilizerTipsResponseModel data}) = LoadedFertilizerState;
  const factory FertilizerState.error({required String message}) = ErrorFertilizerState;
}
