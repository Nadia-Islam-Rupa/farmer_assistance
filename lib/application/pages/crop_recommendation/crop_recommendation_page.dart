// ignore_for_file: use_build_context_synchronously

import 'package:farmer_assistance/application/pages/crop_recommendation/models/crop_recommendation_result.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/providers/crop_recommendation_provider.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/widgets/crop_form_card.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/widgets/crop_header_card.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/widgets/crop_result_card.dart';
import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CropRecommendationPage extends ConsumerStatefulWidget {
  const CropRecommendationPage({super.key});

  @override
  ConsumerState<CropRecommendationPage> createState() =>
      _CropRecommendationPageState();
}

class _CropRecommendationPageState
    extends ConsumerState<CropRecommendationPage> {
  String? selectedSoilType;

  @override
  void initState() {
    super.initState();
    // Auto-fill weather data when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoFillWeatherData();
    });
  }

  void _autoFillWeatherData() {
    final weatherAsync = ref.read(weatherProvider);
    weatherAsync.whenData((weather) {
      if (!ref.read(cropWeatherAutofilledProvider)) {
        _applyWeatherData(weather, force: false);
      }
    });
  }

  void _applyWeatherData(Map<String, dynamic> weather, {required bool force}) {
    final current = weather['current'] as Map<String, dynamic>?;
    final temperatureController = ref.read(cropTemperatureControllerProvider);
    final humidityController = ref.read(cropHumidityControllerProvider);

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
        (force || humidityController.text.trim().isEmpty)) {
      humidityController.text = currentHumidity.toStringAsFixed(1);
      hasChanges = true;
    }

    if (hasChanges) {
      ref.read(cropWeatherAutofilledProvider.notifier).markAutofilled();
      ref
          .read(cropWeatherSourceLabelProvider.notifier)
          .setLabel(weather['_locationLabel']?.toString() ?? 'Live weather');
    }
  }

  Future<void> _fillFromLatestWeather() async {
    try {
      final weather = await ref.read(weatherProvider.future);
      _applyWeatherData(weather, force: true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Weather data updated successfully!'),
          backgroundColor: Color(0xff00796B),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to fetch weather data. Please try again.'),
          backgroundColor: Colors.redAccent,
        ),
      );
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

      // For now, using dummy logic
      await Future.delayed(const Duration(seconds: 1));

      // Dummy recommendation logic (replace with API call)
      String recommendedCrop = _getDummyRecommendation(
        nitrogen,
        phosphorus,
        potassium,
        ph,
        temperature,
        humidity,
        rainfall,
      );

      final result = CropRecommendationResult(
        cropName: recommendedCrop,
        confidence: 0.85,
        tips: _getDummyTips(recommendedCrop),
        inputData: {
          'nitrogen': nitrogen,
          'phosphorus': phosphorus,
          'potassium': potassium,
          'ph': ph,
          'temperature': temperature,
          'humidity': humidity,
          'rainfall': rainfall,
          'soil_type': selectedSoilType,
        },
      );

      ref.read(cropRecommendationProvider.notifier).setRecommendation(result);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Crop recommendation generated successfully!'),
          backgroundColor: Color(0xff00796B),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      ref.read(cropRecommendationLoadingProvider.notifier).setLoading(false);
    }
  }

  // Dummy recommendation logic (replace with API call)
  String _getDummyRecommendation(
    double n,
    double p,
    double k,
    double ph,
    double temp,
    double humidity,
    double rainfall,
  ) {
    // Simple logic for demo purposes
    if (rainfall > 200 && humidity > 80) {
      return 'Rice';
    } else if (temp < 25 && rainfall < 100) {
      return 'Wheat';
    } else if (n > 80 && k > 40) {
      return 'Sugarcane';
    } else if (temp > 30 && rainfall > 150) {
      return 'Cotton';
    } else if (ph > 6.5 && ph < 7.5) {
      return 'Maize';
    } else if (humidity > 70) {
      return 'Jute';
    } else {
      return 'Wheat';
    }
  }

  List<String> _getDummyTips(String crop) {
    final Map<String, List<String>> cropTips = {
      'Rice': [
        'Maintain standing water of 2-3 inches during growing season',
        'Apply nitrogen fertilizer in split doses',
        'Watch for brown plant hopper and stem borer pests',
      ],
      'Wheat': [
        'Sow seeds at proper depth of 5-6 cm',
        'Irrigation is critical at tillering and grain filling stages',
        'Apply balanced NPK fertilization for better yield',
      ],
      'Maize': [
        'Ensure proper spacing of 60-75 cm between rows',
        'Side-dress nitrogen at knee-high stage',
        'Control fall armyworm and other pests regularly',
      ],
      'Cotton': [
        'Maintain soil moisture during flowering and boll formation',
        'Apply potassium for better fiber quality',
        'Watch for bollworm and whitefly infestations',
      ],
      'Sugarcane': [
        'Plant healthy seed cane from disease-free sources',
        'Apply high nitrogen and potassium fertilizers',
        'Ensure proper irrigation at tillering and grand growth phases',
      ],
      'Jute': [
        'Sow in well-drained soil with high organic matter',
        'Requires high humidity and rainfall',
        'Harvest when plants flower for best fiber quality',
      ],
    };

    return cropTips[crop] ??
        [
          'Ensure proper soil preparation before planting',
          'Apply balanced fertilizers based on soil test',
          'Monitor for pests and diseases regularly',
        ];
  }

  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(cropRecommendationFormKeyProvider);
    final result = ref.watch(cropRecommendationProvider);
    final weatherAsync = ref.watch(weatherProvider);
    final weatherSourceLabel = ref.watch(cropWeatherSourceLabelProvider);
    final isLoading = ref.watch(cropRecommendationLoadingProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xffF1FAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xff00796B),
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
              const Color(0xff00796B).withValues(alpha: 0.1),
              Colors.white,
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
                    subtitleStyle: textTheme.bodyMedium,
                    hasWeather: weatherAsync.hasValue,
                    weatherSourceLabel: weatherSourceLabel,
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
                        foregroundColor: const Color(0xff00796B),
                        side: const BorderSide(color: Color(0xff00796B)),
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
                        backgroundColor: const Color(0xff00796B),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        disabledBackgroundColor: const Color(
                          0xff00796B,
                        ).withValues(alpha: 0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  if (result != null) ...[
                    const SizedBox(height: 20),
                    CropResultCard(result: result),
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
