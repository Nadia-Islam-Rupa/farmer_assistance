part of 'forget_password_bloc.dart';

@freezed
abstract class ForgetPasswordEvent with _$ForgetPasswordEvent {
  const factory ForgetPasswordEvent.started({required String email}) = _Started;
}
