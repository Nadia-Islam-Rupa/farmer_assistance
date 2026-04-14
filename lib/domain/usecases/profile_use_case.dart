import 'package:dartz/dartz.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/user_model.dart';
import 'package:farmer_assistance/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCase(this._profileRepository);

  Future<Either<Failures, UserModel>> getProfile() async =>
      await _profileRepository.getProfile();

  Future<Either<Failures, void>> updateProfile(UserModel user) async =>
      await _profileRepository.updateProfile(user);
}
