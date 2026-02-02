import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../repositories/auth_repository.dart';

@injectable
class AuthUseCase {
  final AuthRepository _authRepository;
  AuthUseCase(this._authRepository);

  Future<Either<Failures, void>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _authRepository.loginWithEmailAndPassword(email, password);
  }

  Future<Either<Failures, void>> loginWithGoogle() async {
    return await _authRepository.loginWithGoogle();
  }

  Future<Either<Failures, void>> logOut() async {
    return await _authRepository.logOut();
  }

  Future<Either<Failures, void>> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    return await _authRepository.registerWithEmailAndPassword(
      email,
      password,
      name,
    );
  }

  Future<Either<Failures, void>> forgotPassword(String email) async {
    return await _authRepository.forgotPassword(email);
  }
}
