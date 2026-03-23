part of 'crop_disease_bloc.dart';

@freezed
class CropDiseaseState with _$CropDiseaseState {
  const factory CropDiseaseState.initial() = _Initial;
  const factory CropDiseaseState.loading() = LoadingCropDiseaseState;
  const factory CropDiseaseState.loaded(CropDiseaseModel cropDiseaseModel) =
      LoadedCropDiseaseState;
  const factory CropDiseaseState.error(String message) = ErrorCropDiseaseState;
}
