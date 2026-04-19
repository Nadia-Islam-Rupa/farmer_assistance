// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/failures/failures.dart';
import '../../../../../domain/usecases/auth_use_case.dart';

part 'reset_password_bloc.freezed.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthUseCase _authUseCase;

  ResetPasswordBloc(this._authUseCase)
      : super(const ResetPasswordState.initial()) {
    on<ResetPasswordEvent>((event, emit) async {
      final password = event.password.trim();
      final confirmPassword = event.confirmPassword.trim();

      emit(ResetPasswordState.initial());

      if (password.isEmpty || confirmPassword.isEmpty) {
        emit(
          ErrorResetPasswordState(message: "Please fill in all fields."),
        );
        return;
      }

      final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^]).{8,}$',
      );
      if (!passwordRegex.hasMatch(password)) {
        emit(
          ErrorResetPasswordState(
            message:
                "Password must be 8+ chars with uppercase, lowercase, number & special character.",
          ),
        );
        return;
      }

      if (password != confirmPassword) {
        emit(ErrorResetPasswordState(message: "Passwords do not match."));
        return;
      }

      emit(LoadingResetPasswordState());
      try {
        final result = await _authUseCase.resetPassword(password);
        result.fold(
          (failure) {
            if (failure is GeneralFailure) {
              emit(ErrorResetPasswordState(message: failure.message));
            } else {
              emit(
                ErrorResetPasswordState(
                  message: "An unknown error occurred.",
                ),
              );
            }
          },
          (_) => emit(SuccessResetPasswordState()),
        );
      } catch (e) {
        emit(ErrorResetPasswordState(message: e.toString()));
      }
    });
  }
}
