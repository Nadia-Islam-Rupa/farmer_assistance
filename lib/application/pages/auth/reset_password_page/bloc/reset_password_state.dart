part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = LoadingResetPasswordState;
  const factory ResetPasswordState.error({required String message}) =
      ErrorResetPasswordState;
  const factory ResetPasswordState.success() = SuccessResetPasswordState;
}
