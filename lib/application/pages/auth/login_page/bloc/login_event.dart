part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started({
    required String email,
    required String password,
  }) = _Started;
  const factory LoginEvent.loginWithGoogle() = _LoginWithGoogle;
  const factory LoginEvent.logOut() = _LogOutEvet;
}
