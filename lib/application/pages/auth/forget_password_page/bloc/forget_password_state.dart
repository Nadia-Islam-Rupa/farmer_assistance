part of 'forget_password_bloc.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = LoadingForgetPasswordState;
  const factory ForgetPasswordState.error({required String message}) =
      ErrorForgetPasswordState;
  const factory ForgetPasswordState.success({required String message}) =
      SuccessForgetPasswordState;
}
