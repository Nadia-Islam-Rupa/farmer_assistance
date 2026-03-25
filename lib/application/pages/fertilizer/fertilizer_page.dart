import 'package:farmer_assistance/application/core/utils/validation_utils.dart';

import 'package:farmer_assistance/application/pages/fertilizer/provider/fertilizer_provider.dart';
import 'package:farmer_assistance/application/pages/fertilizer/services/fertilizer_calculation_service.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_form_card.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_header_card.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_result_card.dart';
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
    final textTheme = Theme.of(context).textTheme;

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
                  FertilizerHeaderCard(subtitleStyle: textTheme.bodyMedium),
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
                  const SizedBox(height: 16),
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
