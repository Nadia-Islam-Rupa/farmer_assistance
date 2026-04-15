import 'dart:io';

import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../models/user_model.dart';

abstract class ProfileRepository {
  Future<Either<Failures, UserModel>> getProfile();
  Future<Either<Failures, void>> updateProfile(File? file, String name);
}
