import 'package:dartz/dartz.dart';
import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/user_model.dart';
import 'package:farmer_assistance/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoriesIml extends ProfileRepository {
  final SupabaseClient _supabaseClient;

  ProfileRepositoriesIml(this._supabaseClient);

  @override
  Future<Either<Failures, UserModel>> getProfile() async {
    try {
      // Get current logged-in user
      final user = _supabaseClient.auth.currentUser;

      if (user == null) {
        return Left(GeneralFailure("User not logged in"));
      }

      final userId = user.id;

      // Fetch user profile from Supabase table
      final response = await _supabaseClient
          .from('users') // your table name
          .select()
          .eq('uuid', userId)
          .single();

      final userModel = UserModel.fromJson(response);

      return Right(userModel);
    } catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateProfile(UserModel user) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
