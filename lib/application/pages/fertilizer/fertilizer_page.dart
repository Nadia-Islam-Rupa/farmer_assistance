// ignore_for_file: use_build_context_synchronously

import 'package:farmer_assistance/application/core/utils/validation_utils.dart';
import 'package:farmer_assistance/application/pages/fertilizer/provider/fertilizer_provider.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_form_card.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_header_card.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_result_card.dart';
import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:farmer_assistance/domain/models/fertilizer_tips_request_model.dart';
import 'package:farmer_assistance/domain/models/fertilizer_tips_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di/di.dart';
import 'bloc/fertilizer_bloc.dart';

class FertilizerRecommendationPage extends StatelessWidget {
  const FertilizerRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FertilizerBloc>(),
      child: const FertilizerRecommendation(),
    );
  }
}

class FertilizerRecommendation extends ConsumerStatefulWidget {
  const FertilizerRecommendation({super.key});

  @override
  ConsumerState<FertilizerRecommendation> createState() =>
      _FertilizerRecommendationState();
}

class _FertilizerRecommendationState
    extends ConsumerState<FertilizerRecommendation> {
  String? selectedCrop;
  String? selectedSoilType;
  FertilizerTipsResponseModel? predictionResult;

  void _applyWeatherData(
    WidgetRef ref,
    Map<String, dynamic> weather, {
    required bool force,
  }) {
    final current = weather['current'] as Map<String, dynamic>?;
    final daily = weather['daily'] as Map<String, dynamic>?;
    final temperatureController = ref.read(
      fertilizerTemperatureControllerProvider,
    );
    final rainfallController = ref.read(fertilizerRainfallControllerProvider);

    final currentTemp = (current?['temperature_2m'] as num?)?.toDouble();
    final precipitationList = daily?['precipitation_sum'] as List<dynamic>?;
    final todayPrecipitation =
        precipitationList != null && precipitationList.isNotEmpty
        ? (precipitationList.first as num?)?.toDouble()
        : (current?['rain'] as num?)?.toDouble();

    var hasChanges = false;

    if (currentTemp != null &&
        (force || temperatureController.text.trim().isEmpty)) {
      temperatureController.text = currentTemp.toStringAsFixed(1);
      hasChanges = true;
    }

    if (todayPrecipitation != null &&
        (force || rainfallController.text.trim().isEmpty)) {
      rainfallController.text = todayPrecipitation.toStringAsFixed(1);
      hasChanges = true;
    }

    if (hasChanges) {
      ref.read(fertilizerWeatherAutofilledProvider.notifier).markAutofilled();
      ref
          .read(fertilizerWeatherSourceLabelProvider.notifier)
          .setLabel(weather['_locationLabel']?.toString() ?? 'Live weather');
    }
  }

  Future<void> _fillFromLatestWeather(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final weather = await ref.read(weatherProvider.future);
      _applyWeatherData(ref, weather, force: true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Temperature and rainfall updated from live weather.'),
          backgroundColor: WaterPredictionTheme.primaryTeal,
        ),
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to fetch weather right now.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _calculateRecommendation() {
    final formKey = ref.read(fertilizerFormKeyProvider);
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    final crop = ref.read(fertilizerCropControllerProvider).text.trim();
    final soilType = ref.read(fertilizerSoilTypeControllerProvider).text.trim();
    final nitrogen =
        double.tryParse(
          ref.read(fertilizerNitrogenControllerProvider).text.trim(),
        ) ??
        0.0;
    final phosphorus =
        double.tryParse(
          ref.read(fertilizerPhosphorusControllerProvider).text.trim(),
        ) ??
        0.0;
    final potassium =
        double.tryParse(
          ref.read(fertilizerPotassiumControllerProvider).text.trim(),
        ) ??
        0.0;
    final ph =
        double.tryParse(ref.read(fertilizerPhControllerProvider).text.trim()) ??
        0.0;
    final rainfall =
        double.tryParse(
          ref.read(fertilizerRainfallControllerProvider).text.trim(),
        ) ??
        0.0;
    final temperature =
        double.tryParse(
          ref.read(fertilizerTemperatureControllerProvider).text.trim(),
        ) ??
        0.0;

    setState(() {
      predictionResult = null;
    });

    context.read<FertilizerBloc>().add(
      FertilizerEvent.started(
        data: FertilizerTipsRequestModel(
          crop: crop,
          soilColor: soilType,
          temperature: temperature,
          nitrogen: nitrogen,
          potassium: potassium,
          phosphorus: phosphorus,
          rainfall: rainfall,
          ph: ph,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(fertilizerFormKeyProvider);
    final weatherAsync = ref.watch(weatherProvider);
    final weatherSourceLabel = ref.watch(fertilizerWeatherSourceLabelProvider);
    final textTheme = Theme.of(context).textTheme;

    ref.listen<AsyncValue<Map<String, dynamic>>>(weatherProvider, (prev, next) {
      next.whenData((weather) {
        if (!ref.read(fertilizerWeatherAutofilledProvider)) {
          _applyWeatherData(ref, weather, force: false);
        }
      });
    });

    return BlocListener<FertilizerBloc, FertilizerState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (data) {
            setState(() {
              predictionResult = data;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Fertilizer recommendation received!'),
                backgroundColor: WaterPredictionTheme.primaryTeal,
                duration: Duration(seconds: 2),
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red.shade700,
                ),
              );
          },
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF1FAF8),
        appBar: AppBar(
          backgroundColor: WaterPredictionTheme.primaryTeal,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Fertilizer Recommendation',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                WaterPredictionTheme.pageTopTint,
                WaterPredictionTheme.pageBottomTint,
              ],
              stops: [0, 0.55],
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
                    FertilizerHeaderCard(
                      subtitleStyle: textTheme.bodyMedium,
                      hasWeather: weatherAsync.hasValue,
                      weatherSourceLabel: weatherSourceLabel,
                    ),
                    const SizedBox(height: 16),
                    FertilizerFormCard(
                      cropController: ref.watch(
                        fertilizerCropControllerProvider,
                      ),
                      soilTypeController: ref.watch(
                        fertilizerSoilTypeControllerProvider,
                      ),
                      nitrogenController: ref.watch(
                        fertilizerNitrogenControllerProvider,
                      ),
                      phosphorusController: ref.watch(
                        fertilizerPhosphorusControllerProvider,
                      ),
                      potassiumController: ref.watch(
                        fertilizerPotassiumControllerProvider,
                      ),
                      phController: ref.watch(fertilizerPhControllerProvider),
                      rainfallController: ref.watch(
                        fertilizerRainfallControllerProvider,
                      ),
                      temperatureController: ref.watch(
                        fertilizerTemperatureControllerProvider,
                      ),
                      requiredText: ValidationUtils.requiredText,
                      requiredNumber: ValidationUtils.requiredNumber,
                      selectedCrop: selectedCrop,
                      selectedSoilType: selectedSoilType,
                      onCropChanged: (value) =>
                          setState(() => selectedCrop = value),
                      onSoilTypeChanged: (value) =>
                          setState(() => selectedSoilType = value),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => _fillFromLatestWeather(context, ref),
                        icon: const Icon(Icons.cloud_sync_outlined),
                        label: const Text('Refresh From Weather'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          foregroundColor: WaterPredictionTheme.deepTeal,
                          side: const BorderSide(
                            color: WaterPredictionTheme.primaryTeal,
                          ),
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
                        onPressed: _calculateRecommendation,
                        icon: const Icon(Icons.analytics_outlined),
                        label: const Text(
                          'Get Recommendation',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 54),
                          backgroundColor: WaterPredictionTheme.primaryTeal,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                    if (predictionResult != null) ...[
                      const SizedBox(height: 20),
                      FertilizerResultCard(
                        result: predictionResult!,
                        textTheme: textTheme,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ); // End of BlocListener
  }
}
