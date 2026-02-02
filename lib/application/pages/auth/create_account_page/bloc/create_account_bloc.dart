import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/failures/failures.dart';
import '../../../../../domain/usecases/auth_use_case.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';
part 'create_account_bloc.freezed.dart';

@injectable
class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final AuthUseCase _authUseCase;
  CreateAccountBloc(this._authUseCase)
    : super(const CreateAccountState.initial()) {
    on<CreateAccountEvent>((event, emit) async {
      final String name = event.name.trim() ?? '';
      final String email = event.email.trim() ?? '';
      final String password = event.password.trim() ?? "";
      final String confirmPassword = event.confirmPassword.trim() ?? '';

      final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
      final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^]).{8,}$',
      );
      emit(LoadingCreateAccountState());
      // 1. Empty field validation
      if (name.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        emit(ErrorAccountCreateState("All fields are required."));
        return;
      }

      // 2. Email format check
      if (!emailRegex.hasMatch(email)) {
        emit(ErrorAccountCreateState("Please enter a valid email address."));
        return;
      }

      // 3. Password complexity check
      if (!passwordRegex.hasMatch(password)) {
        emit(
          ErrorAccountCreateState(
            "Password must be at least 8 characters long and include upper case, lower case, number, and special character.",
          ),
        );
        return;
      }

      // 4. Password and confirmPassword match check
      if (password != confirmPassword) {
        emit(ErrorAccountCreateState("Passwords do not match."));
        return;
      }

      // 5. Proceed with account creation
      emit(LoadingCreateAccountState());
      try {
        final result = await _authUseCase.registerWithEmailAndPassword(
          email,
          password,
          name,
        );

        result.fold(
          (failure) {
            if (failure is EmailAlreadyInUseFailure) {
              emit(ErrorAccountCreateState("This email is already in use."));
            } else if (failure is WeakPasswordFailure) {
              emit(ErrorAccountCreateState("The password is too weak."));
            } else if (failure is UnknownAuthFailure) {
              emit(
                ErrorAccountCreateState(
                  "Authentication failed due to unknown error.",
                ),
              );
            } else if (failure is GeneralFailure) {
              emit(ErrorAccountCreateState(failure.message));
            } else {
              emit(
                ErrorAccountCreateState(
                  "Something went wrong. Please try again.",
                ),
              );
            }
          },
          (r) {
            emit(SuccessCreateAccountState());
          },
        );
      } catch (e) {
        emit(
          ErrorAccountCreateState("Failed to create account: ${e.toString()}"),
        );
      }
    });
  }
}
