import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  @singleton
  SupabaseClient get supabase => Supabase.instance.client;

  @singleton
  GoogleSignIn get googleSignIn => GoogleSignIn.instance;
}
