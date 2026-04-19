part of 'reset_password_bloc.dart';

@freezed
abstract class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.started({
    required String password,
    required String confirmPassword,
  }) = _Started;
}
