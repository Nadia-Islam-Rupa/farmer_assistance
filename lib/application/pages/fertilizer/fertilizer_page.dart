// ignore_for_file: use_build_context_synchronously

import 'package:farmer_assistance/application/core/utils/validation_utils.dart';

import 'package:farmer_assistance/application/pages/fertilizer/provider/fertilizer_provider.dart';
import 'package:farmer_assistance/application/pages/fertilizer/services/fertilizer_calculation_service.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_form_card.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_header_card.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_result_card.dart';
import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FertilizerRecommendationPage extends ConsumerStatefulWidget {
  const FertilizerRecommendationPage({super.key});

  @override
  ConsumerState<FertilizerRecommendationPage> createState() =>
      _FertilizerRecommendationPageState();
}

class _FertilizerRecommendationPageState
    extends ConsumerState<FertilizerRecommendationPage> {
  String? selectedCrop;
  String? selectedSoilType;

  void _applyWeatherData(
    WidgetRef ref,
    Map<String, dynamic> weather, {
    required bool force,
  }) {
    final current = weather['current'] as Map<String, dynamic>?;
    final temperatureController = ref.read(
      fertilizerTemperatureControllerProvider,
    );
    final moistureController = ref.read(fertilizerMoistureControllerProvider);

    final currentTemp = (current?['temperature_2m'] as num?)?.toDouble();
    final currentHumidity = (current?['relative_humidity_2m'] as num?)
        ?.toDouble();

    var hasChanges = false;

    if (currentTemp != null &&
        (force || temperatureController.text.trim().isEmpty)) {
      temperatureController.text = currentTemp.toStringAsFixed(1);
      hasChanges = true;
    }

    if (currentHumidity != null &&
        (force || moistureController.text.trim().isEmpty)) {
      moistureController.text = currentHumidity.toStringAsFixed(1);
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
          content: Text('Temperature and moisture updated from live weather.'),
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
    final nitrogen = double.parse(
      ref.read(fertilizerNitrogenControllerProvider).text.trim(),
    );
    final phosphorus = double.parse(
      ref.read(fertilizerPhosphorusControllerProvider).text.trim(),
    );
    final potassium = double.parse(
      ref.read(fertilizerPotassiumControllerProvider).text.trim(),
    );
    final moisture = double.parse(
      ref.read(fertilizerMoistureControllerProvider).text.trim(),
    );
    final temperature = double.parse(
      ref.read(fertilizerTemperatureControllerProvider).text.trim(),
    );

    final result = FertilizerCalculationService.calculateRecommendation(
      crop: crop,
      soilType: soilType,
      nitrogen: nitrogen,
      phosphorus: phosphorus,
      potassium: potassium,
      moisture: moisture,
      temperature: temperature,
    );

    ref
        .read(fertilizerRecommendationProvider.notifier)
        .setRecommendation(result);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fertilizer recommendation calculated successfully!'),
        backgroundColor: WaterPredictionTheme.primaryTeal,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(fertilizerFormKeyProvider);
    final result = ref.watch(fertilizerRecommendationProvider);
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

    return Scaffold(
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
                    cropController: ref.watch(fertilizerCropControllerProvider),
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
                    moistureController: ref.watch(
                      fertilizerMoistureControllerProvider,
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
                  if (result != null) ...[
                    const SizedBox(height: 20),
                    FertilizerResultCard(result: result),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
