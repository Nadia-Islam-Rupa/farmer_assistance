part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = LoadingLoginState;
  const factory LoginState.success() = SuccessLoginState;
  const factory LoginState.error({required String message}) = ErrorLoginState;
  const factory LoginState.signOut() = SignOutLoginState;
  const factory LoginState.errorSignOut({required String message}) =
      ErrorSignOut;
  const factory LoginState.signOutSuccess() = LogOutSuccessState;
}
