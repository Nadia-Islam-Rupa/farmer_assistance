part of 'crop_recommendation_bloc.dart';

@freezed
class CropRecommendationState with _$CropRecommendationState {
  const factory CropRecommendationState.initial() = _Initial;
  const factory CropRecommendationState.loading() = LoadingCropRecommendationState;
  const factory CropRecommendationState.loaded({required CropRecommendationResponseModel data}) = LoadedCropRecommendationState;
  const factory CropRecommendationState.error({required String message}) = ErrorCropRecommendationState;
}
