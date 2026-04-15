// ignore_for_file: use_build_context_synchronously

import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/providers/crop_recommendation_provider.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/services/weather_autofill_service.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/utils/crop_snackbar_utils.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/widgets/crop_form_card.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/widgets/crop_header_card.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/widgets/crop_result_card.dart';
import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/Crop_recommendation_request_model.dart';
import 'bloc/crop_recommendation_bloc.dart';

class CropRecommendationPage extends StatelessWidget {
  const CropRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CropRecommendationBloc>(),
      child: const CropRecommendation(),
    );
  }
}

class CropRecommendation extends ConsumerStatefulWidget {
  const CropRecommendation({super.key});

  @override
  ConsumerState<CropRecommendation> createState() => _CropRecommendationState();
}

class _CropRecommendationState extends ConsumerState<CropRecommendation> {
  String? selectedSoilType;
  late WeatherAutofillService _weatherService;

  @override
  void initState() {
    super.initState();
    // Auto-fill weather data when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _weatherService = WeatherAutofillService(ref);
      _weatherService.initializeAutofill();
    });
  }

  Future<void> _fillFromLatestWeather() async {
    try {
      _weatherService = WeatherAutofillService(ref);
      await _weatherService.refreshWeatherData();
      if (mounted) {
        CropSnackbarUtils.showWeatherUpdateSuccess(context);
      }
    } catch (e) {
      if (mounted) {
        CropSnackbarUtils.showWeatherUpdateError(context);
      }
    }
  }

  Future<void> _getRecommendation() async {
    final formKey = ref.read(cropRecommendationFormKeyProvider);
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    // Set loading state
    ref.read(cropRecommendationLoadingProvider.notifier).setLoading(true);

    try {
      // Get form values
      final nitrogen = double.parse(
        ref.read(cropNitrogenControllerProvider).text.trim(),
      );
      final phosphorus = double.parse(
        ref.read(cropPhosphorusControllerProvider).text.trim(),
      );
      final potassium = double.parse(
        ref.read(cropPotassiumControllerProvider).text.trim(),
      );
      final ph = double.parse(ref.read(cropPhControllerProvider).text.trim());
      final temperature = double.parse(
        ref.read(cropTemperatureControllerProvider).text.trim(),
      );
      final humidity = double.parse(
        ref.read(cropHumidityControllerProvider).text.trim(),
      );
      final rainfall = double.parse(
        ref.read(cropRainfallControllerProvider).text.trim(),
      );

      context.read<CropRecommendationBloc>().add(
        CropRecommendationEvent.started(
          cropRecommendationRequestModel: CropRecommendationRequestModel(
            nitrogen: nitrogen,
            phosphorus: phosphorus,
            potassium: potassium,
            ph: ph,
            temperature: temperature,
            humidity: humidity,
            rainfall: rainfall,
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        CropSnackbarUtils.showRecommendationError(context, e.toString());
      }
    } finally {
      ref.read(cropRecommendationLoadingProvider.notifier).setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(cropRecommendationFormKeyProvider);
    final weatherAsync = ref.watch(weatherProvider);
    final weatherSourceLabel = ref.watch(cropWeatherSourceLabelProvider);
    final isLoading = ref.watch(cropRecommendationLoadingProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Crop Recommendation',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.pageTopTint,
              AppTheme.pageBottomTint,
            ],
            stops: const [0, 0.3],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CropHeaderCard(
                    hasWeather: weatherAsync.hasValue,
                    weatherSourceLabel: weatherSourceLabel,
                    textTheme: textTheme,
                  ),
                  const SizedBox(height: 16),
                  CropFormCard(
                    nitrogenController: ref.watch(
                      cropNitrogenControllerProvider,
                    ),
                    phosphorusController: ref.watch(
                      cropPhosphorusControllerProvider,
                    ),
                    potassiumController: ref.watch(
                      cropPotassiumControllerProvider,
                    ),
                    phController: ref.watch(cropPhControllerProvider),
                    temperatureController: ref.watch(
                      cropTemperatureControllerProvider,
                    ),
                    humidityController: ref.watch(
                      cropHumidityControllerProvider,
                    ),
                    rainfallController: ref.watch(
                      cropRainfallControllerProvider,
                    ),
                    selectedSoilType: selectedSoilType,
                    onSoilTypeChanged: (value) =>
                        setState(() => selectedSoilType = value),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _fillFromLatestWeather,
                      icon: const Icon(Icons.cloud_sync_outlined),
                      label: const Text('Refresh Weather Data'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        foregroundColor: AppTheme.primaryTeal,
                        side: const BorderSide(color: AppTheme.primaryTeal),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: isLoading ? null : _getRecommendation,
                      icon: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Icon(Icons.analytics_outlined),
                      label: Text(
                        isLoading ? 'Analyzing...' : 'Get Crop Recommendation',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 54),
                        backgroundColor: AppTheme.primaryTeal,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        disabledBackgroundColor: AppTheme.primaryTeal.withValues(alpha: 0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  BlocConsumer<CropRecommendationBloc, CropRecommendationState>(
                    builder: (context, state) {
                      if (state is LoadedCropRecommendationState) {
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                            CropResultCard(result: state.data),
                          ],
                        );
                      }
                      return const SizedBox(height: 20);
                    },
                    listener: (context, state) {
                      if (state is ErrorCropRecommendationState) {
                        CropSnackbarUtils.showRecommendationError(
                          context,
                          state.message,
                        );
                      }
                      if (state is LoadedCropRecommendationState) {
                        CropSnackbarUtils.showRecommendationSuccess(context);
                        ref
                            .read(cropRecommendationProvider.notifier)
                            .setRecommendation(state.data);
                      }
                    },
                  ),
                  // if (result != null) ...[
                  //   const SizedBox(height: 20),
                  //   CropResultCard(result: result),
                  // ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
