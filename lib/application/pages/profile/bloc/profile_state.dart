part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = LoadingProfileInfoState;
  const factory ProfileState.loaded({required UserModel userModel}) =
      LoadedProfileInfoState;
  const factory ProfileState.error({required String message}) =
      ErrorProfileInfoState;
}
