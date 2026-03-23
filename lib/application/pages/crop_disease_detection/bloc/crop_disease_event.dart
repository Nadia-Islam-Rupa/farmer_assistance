part of 'crop_disease_bloc.dart';

@freezed
abstract class CropDiseaseEvent with _$CropDiseaseEvent {
  const factory CropDiseaseEvent.started({required File imageFile}) = _Started;

}
