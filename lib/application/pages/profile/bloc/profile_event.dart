part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.fetchProfileInfo() = _FetchProfileInfo;
  const factory ProfileEvent.updateProfileInfo({required File? file, required String name}) = _UpdateProfileInfo;

}
