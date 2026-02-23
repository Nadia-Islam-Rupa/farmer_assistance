import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  // 🔹 Supabase
  @singleton
  SupabaseClient get supabase => Supabase.instance.client;

  // 🔹 Google Sign In
  @singleton
  GoogleSignIn get googleSignIn => GoogleSignIn.instance;

  // 🔹 Pretty Dio Logger
  @singleton
  PrettyDioLogger prettyDioLogger() => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    error: true,
    compact: true,
    maxWidth: 90,
  );

  // 🔹 Dio (CONFIGURED ONCE)
  @singleton
  Dio dio(
      SupabaseClient supabase,
      PrettyDioLogger logger,
      ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.123:8000',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    // 🔐 Supabase access token interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final session = supabase.auth.currentSession;
          final token = session?.accessToken;

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      ),
    );

    // 🧾 Logger (debug only)
    if (!kReleaseMode) {
      dio.interceptors.add(logger);
    }

    return dio;
  }
}