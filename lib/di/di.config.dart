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
import 'package:farmer_assistance/application/pages/chatbot/bloc/chat_bloc.dart'
    as _i1025;
import 'package:farmer_assistance/application/pages/chatbot/bloc/conversations_list_bloc.dart'
    as _i539;
import 'package:farmer_assistance/application/pages/crop_disease_detection/bloc/crop_disease_bloc.dart'
    as _i376;
import 'package:farmer_assistance/application/pages/crop_recommendation/bloc/crop_recommendation_bloc.dart'
    as _i582;
import 'package:farmer_assistance/application/pages/fertilizer/bloc/fertilizer_bloc.dart'
    as _i993;
import 'package:farmer_assistance/application/pages/market_trends/bloc/price_prediction_bloc.dart'
    as _i777;
import 'package:farmer_assistance/application/pages/water_prediction/bloc/water_prediction_bloc.dart'
    as _i20;
import 'package:farmer_assistance/application/pages/yield_prediction/bloc/yield_prediction_bloc.dart'
    as _i333;
import 'package:farmer_assistance/data/datasources/remote_datasource/api_service.dart.dart'
    as _i991;
import 'package:farmer_assistance/data/repositories/auth_repositories_iml.dart'
    as _i139;
import 'package:farmer_assistance/data/repositories/chat_repository_impl.dart'
    as _i830;
import 'package:farmer_assistance/data/repositories/crop_disease_detection_repository_iml.dart'
    as _i607;
import 'package:farmer_assistance/data/repositories/crop_recommendation_repositories_iml.dart'
    as _i733;
import 'package:farmer_assistance/data/repositories/fertilizer_tips_repositories_iml.dart'
    as _i674;
import 'package:farmer_assistance/data/repositories/price_prediction_repository_impl.dart'
    as _i888;
import 'package:farmer_assistance/data/repositories/smart_irrigation_repositories_iml.dart'
    as _i537;
import 'package:farmer_assistance/data/repositories/yield_estimation_repositories_iml.dart'
    as _i158;
import 'package:farmer_assistance/di/register_module.dart' as _i625;
import 'package:farmer_assistance/domain/repositories/auth_repository.dart'
    as _i953;
import 'package:farmer_assistance/domain/repositories/chat_repository.dart'
    as _i350;
import 'package:farmer_assistance/domain/repositories/crop_disease_detection_repository.dart'
    as _i344;
import 'package:farmer_assistance/domain/repositories/crop_recommendation_repository.dart'
    as _i434;
import 'package:farmer_assistance/domain/repositories/fertilizer_tips_repository.dart'
    as _i421;
import 'package:farmer_assistance/domain/repositories/price_prediction_repository.dart'
    as _i999;
import 'package:farmer_assistance/domain/repositories/smart_irrigation_repository.dart'
    as _i835;
import 'package:farmer_assistance/domain/repositories/yield_estimation_repository.dart'
    as _i612;
import 'package:farmer_assistance/domain/usecases/auth_use_case.dart' as _i382;
import 'package:farmer_assistance/domain/usecases/chat_use_case.dart' as _i735;
import 'package:farmer_assistance/domain/usecases/crop_disease_use_case.dart'
    as _i347;
import 'package:farmer_assistance/domain/usecases/crop_recommendation_use_case.dart'
    as _i2;
import 'package:farmer_assistance/domain/usecases/fertilizer_tips_use_case.dart'
    as _i624;
import 'package:farmer_assistance/domain/usecases/price_prediction_use_case.dart'
    as _i456;
import 'package:farmer_assistance/domain/usecases/smart_irrigation_use_case.dart'
    as _i866;
import 'package:farmer_assistance/domain/usecases/yield_estimation_use_case.dart'
    as _i574;
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
    gh.factory<_i421.FertilizerTipsRepository>(
      () => _i674.FertilizerTipsRepositoriesIml(gh<_i991.ApiService>()),
    );
    gh.factory<_i434.CropRecommendationRepository>(
      () => _i733.CropRecommendationRepositoriesIml(gh<_i991.ApiService>()),
    );
    gh.factory<_i612.YieldEstimationRepository>(
      () => _i158.YieldEstimationRepositoriesIml(gh<_i991.ApiService>()),
    );
    gh.factory<_i574.YieldEstimationUseCase>(
      () => _i574.YieldEstimationUseCase(gh<_i612.YieldEstimationRepository>()),
    );
    gh.factory<_i835.SmartIrrigationRepository>(
      () => _i537.SmartIrrigationRepositoriesIml(gh<_i991.ApiService>()),
    );
    gh.factory<_i350.ChatRepository>(
      () => _i830.ChatRepositoryImpl(gh<_i991.ApiService>()),
    );
    gh.factory<_i735.ChatUseCase>(
      () => _i735.ChatUseCase(gh<_i350.ChatRepository>()),
    );
    gh.factory<_i866.SmartIrrigationUseCase>(
      () => _i866.SmartIrrigationUseCase(gh<_i835.SmartIrrigationRepository>()),
    );
    gh.factory<_i344.CropDiseaseDetectionRepository>(
      () => _i607.CropDiseaseDetectionRepositoryIml(gh<_i991.ApiService>()),
    );
    gh.factory<_i20.WaterPredictionBloc>(
      () => _i20.WaterPredictionBloc(
        smartIrrigationUseCase: gh<_i866.SmartIrrigationUseCase>(),
      ),
    );
    gh.factory<_i1025.ChatBloc>(() => _i1025.ChatBloc(gh<_i735.ChatUseCase>()));
    gh.factory<_i539.ConversationsListBloc>(
      () => _i539.ConversationsListBloc(gh<_i735.ChatUseCase>()),
    );
    gh.factory<_i624.FertilizerTipsUseCase>(
      () => _i624.FertilizerTipsUseCase(gh<_i421.FertilizerTipsRepository>()),
    );
    gh.factory<_i2.CropRecommendationUseCase>(
      () => _i2.CropRecommendationUseCase(
        gh<_i434.CropRecommendationRepository>(),
      ),
    );
    gh.factory<_i333.YieldPredictionBloc>(
      () => _i333.YieldPredictionBloc(
        yieldEstimationUseCase: gh<_i574.YieldEstimationUseCase>(),
      ),
    );
    gh.factory<_i993.FertilizerBloc>(
      () => _i993.FertilizerBloc(
        fertilizerTipsUseCase: gh<_i624.FertilizerTipsUseCase>(),
      ),
    );
    gh.factory<_i582.CropRecommendationBloc>(
      () => _i582.CropRecommendationBloc(
        cropRecommendationUseCase: gh<_i2.CropRecommendationUseCase>(),
      ),
    );
    gh.factory<_i347.CropDiseaseUseCase>(
      () =>
          _i347.CropDiseaseUseCase(gh<_i344.CropDiseaseDetectionRepository>()),
    );
    gh.factory<_i376.CropDiseaseBloc>(
      () => _i376.CropDiseaseBloc(gh<_i347.CropDiseaseUseCase>()),
    );
    gh.factory<_i999.PricePredictionRepository>(
      () => _i888.PricePredictionRepositoryImpl(gh<_i991.ApiService>()),
    );
    gh.factory<_i456.PricePredictionUseCase>(
      () => _i456.PricePredictionUseCase(gh<_i999.PricePredictionRepository>()),
    );
    gh.factory<_i777.PricePredictionBloc>(
      () => _i777.PricePredictionBloc(
        pricePredictionUseCase: gh<_i456.PricePredictionUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i625.RegisterModule {}
