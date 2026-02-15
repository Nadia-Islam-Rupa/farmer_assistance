import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/failures/failures.dart';
import '../../../../../domain/usecases/auth_use_case.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';
part 'forget_password_bloc.freezed.dart';

@injectable
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final AuthUseCase _authUseCase;
  ForgetPasswordBloc(this._authUseCase)
    : super(const ForgetPasswordState.initial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      final email = event.email.trim().toLowerCase();

      emit(ForgetPasswordState.initial());

      // Field null/empty check
      if (email.isEmpty) {
        emit(ErrorForgetPasswordState(message: "Please enter your email"));
        return;
      }

      // Email validation
      final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
      if (!emailRegex.hasMatch(email) || !EmailValidator.validate(email)) {
        emit(ErrorForgetPasswordState(message: "Invalid email format."));
        return;
      }

      emit(LoadingForgetPasswordState());
      try {
        final result = await _authUseCase.forgotPassword(email);
        result.fold(
          (failure) {
            if (failure is UserNotFoundFailure) {
              emit(
                ErrorForgetPasswordState(
                  message: "No user found for that email.",
                ),
              );
            } else if (failure is InvalidCredentialFailure) {
              emit(
                ErrorForgetPasswordState(
                  message: "The email is incorrect. Please try again.",
                ),
              );
            } else if (failure is UserDisabledFailure) {
              emit(
                ErrorForgetPasswordState(
                  message:
                      "This user account has been disabled. Please contact support.",
                ),
              );
            } else if (failure is GeneralFailure) {
              emit(ErrorForgetPasswordState(message: failure.message));
            } else {
              emit(
                ErrorForgetPasswordState(message: "An unknown error occurred."),
              );
            }
          },
          (_) => emit(
            SuccessForgetPasswordState(
              message: 'Password reset link sent to $email! Check your email.',
            ),
          ),
        );
      } catch (e) {
        emit(ErrorForgetPasswordState(message: e.toString()));
      }
    });
  }
}
