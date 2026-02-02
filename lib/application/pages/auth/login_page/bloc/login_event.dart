part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started({
    required String email,
    required String password,
  }) = _Started;
  const factory LoginEvent.loginWithGoogle() = _LoginWithGoogle;
  const factory LoginEvent.logOut() = _LogOutEvet;

  // const factory LoginEvent.createAccount({
  //   required String email,
  //   required String password,
  //   required String name,
  //   required String confirmPassword,
  // }) = _CreateAccountEvent;
  //
  // const factory LoginEvent.forgotPassword({
  //   required String email,
  // }) = _ForgotPasswordEvent;
}
