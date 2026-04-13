part of 'crop_recommendation_bloc.dart';

@freezed
abstract class CropRecommendationEvent with _$CropRecommendationEvent {
  const factory CropRecommendationEvent.started({required CropRecommendationRequestModel cropRecommendationRequestModel}) = _Started;
}
