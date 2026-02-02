import 'package:dartz/dartz.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, void>> loginWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failures, void>> loginWithGoogle();
  Future<Either<Failures, void>> logOut();

  Future<Either<Failures, void>> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Failures, void>> forgotPassword(String email);
}
