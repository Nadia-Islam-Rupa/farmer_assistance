// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:farmer_assistance/application/pages/auth/create_account_page/bloc/create_account_bloc.dart'
    as _i1041;
import 'package:farmer_assistance/application/pages/auth/forget_password_page/bloc/forget_password_bloc.dart'
    as _i430;
import 'package:farmer_assistance/application/pages/auth/login_page/bloc/login_bloc.dart'
    as _i860;
import 'package:farmer_assistance/application/pages/crop_disease_detection/bloc/crop_disease_bloc.dart'
    as _i376;
import 'package:farmer_assistance/data/datasources/remote_datasource/api_service.dart.dart'
    as _i991;
import 'package:farmer_assistance/data/repositories/auth_repositories_iml.dart'
    as _i139;
import 'package:farmer_assistance/data/repositories/crop_disease_detection_repository_iml.dart'
    as _i607;
import 'package:farmer_assistance/di/register_module.dart' as _i625;
import 'package:farmer_assistance/domain/repositories/auth_repository.dart'
    as _i953;
import 'package:farmer_assistance/domain/repositories/crop_disease_detection_repository.dart'
    as _i344;
import 'package:farmer_assistance/domain/usecases/auth_use_case.dart' as _i382;
import 'package:farmer_assistance/domain/usecases/crop_disease_use_case.dart'
    as _i347;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i454.SupabaseClient>(() => registerModule.supabase);
    gh.singleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.singleton<_i528.PrettyDioLogger>(() => registerModule.prettyDioLogger());
    gh.lazySingleton<_i953.AuthRepository>(
      () => _i139.AuthRepositoriesIml(
        gh<_i116.GoogleSignIn>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.factory<_i382.AuthUseCase>(
      () => _i382.AuthUseCase(gh<_i953.AuthRepository>()),
    );
    gh.singleton<_i361.Dio>(
      () => registerModule.dio(
        gh<_i454.SupabaseClient>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i1041.CreateAccountBloc>(
      () => _i1041.CreateAccountBloc(gh<_i382.AuthUseCase>()),
    );
    gh.factory<_i430.ForgetPasswordBloc>(
      () => _i430.ForgetPasswordBloc(gh<_i382.AuthUseCase>()),
    );
    gh.factory<_i860.LoginBloc>(() => _i860.LoginBloc(gh<_i382.AuthUseCase>()));
    gh.factory<_i991.ApiService>(() => _i991.ApiService(gh<_i361.Dio>()));
    gh.factory<_i344.CropDiseaseDetectionRepository>(
      () => _i607.CropDiseaseDetectionRepositoryIml(gh<_i991.ApiService>()),
    );
    gh.factory<_i347.CropDiseaseUseCase>(
      () =>
          _i347.CropDiseaseUseCase(gh<_i344.CropDiseaseDetectionRepository>()),
    );
    gh.factory<_i376.CropDiseaseBloc>(
      () => _i376.CropDiseaseBloc(gh<_i347.CropDiseaseUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i625.RegisterModule {}
