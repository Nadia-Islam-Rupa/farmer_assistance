part of 'fertilizer_bloc.dart';

@freezed
abstract class FertilizerEvent with _$FertilizerEvent {
  const factory FertilizerEvent.started({
    required FertilizerTipsRequestModel data,
  }) = _Started;
}
