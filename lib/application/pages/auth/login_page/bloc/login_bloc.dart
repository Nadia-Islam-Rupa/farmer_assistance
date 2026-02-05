import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/failures/failures.dart';
import '../../../../../domain/usecases/auth_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase _authUseCase;
  LoginBloc(this._authUseCase) : super(const LoginState.initial()) {
    on<_Started>((event, emit) async {
      final email = event.email.trim();
      final password = event.password.trim();
      emit(LoadingLoginState());

      // Field null/empty check
      if (email.isEmpty || password.isEmpty) {
        emit(ErrorLoginState(message: "All fields are required."));
        return;
      }

      // Email validation
      final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
      if (!emailRegex.hasMatch(email)) {
        emit(ErrorLoginState(message: "Invalid email format."));
        return;
      }

      // Password length check
      if (password.length < 8) {
        emit(
          ErrorLoginState(message: "Password must be at least 8 characters."),
        );
        return;
      }
      emit(LoadingLoginState());

      try {
        final result = await _authUseCase.loginWithEmailAndPassword(
          email,
          password,
        ); // your signIn()

        result.fold(
          (failure) {
            if (failure is UserNotFoundFailure) {
              emit(ErrorLoginState(message: "No user found for that email."));
            } else if (failure is WrongPasswordFailure) {
              emit(ErrorLoginState(message: "Incorrect password."));
            } else if (failure is InvalidCredentialFailure) {
              emit(
                ErrorLoginState(
                  message:
                      "The email or password is incorrect. Please try again.",
                ),
              );
            } else if (failure is UserDisabledFailure) {
              emit(
                ErrorLoginState(
                  message:
                      "This user account has been disabled. Please contact support.",
                ),
              );
            } else if (failure is GeneralFailure) {
              emit(ErrorLoginState(message: failure.message));
            } else {
              emit(ErrorLoginState(message: "An unknown error occurred."));
            }
          },
          (userCredential) {
            emit(SuccessLoginState());
          },
        );
      } catch (e) {
        emit(ErrorLoginState(message: e.toString()));
      }
    });
    on<_LoginWithGoogle>((event, emit) async {
      try {
        emit(LoadingLoginState());
        final result = await _authUseCase.loginWithGoogle();
        // emit(LoadingLoginState());

        result.fold(
          (failure) {
            if (failure is GeneralFailure) {
              emit(ErrorLoginState(message: failure.message));
            } else if (failure is UserDisabledFailure) {
              emit(
                LoginState.error(
                  message:
                      "This user account has been disabled. Please contact support.",
                ),
              );
            } else if (failure is InvalidCredentialFailure) {
              emit(
                ErrorLoginState(
                  message:
                      "The email or password is incorrect. Please try again.",
                ),
              );
            } else {
              emit(ErrorLoginState(message: "An unknown error occurred."));
            }
          },
          (r) {
            emit(SuccessLoginState());
          },
        );
      } catch (e) {
        emit(LoginState.error(message: e.toString()));
      }
    });

    on<_LogOutEvet>((event, emit) async {
      emit(LoadingLoginState());
      try {
        await _authUseCase.logOut();
        emit(const LogOutSuccessState());
      } catch (e) {
        emit(LoginState.error(message: e.toString()));
      }
    });
  }
}
