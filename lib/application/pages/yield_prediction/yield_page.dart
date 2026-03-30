// ignore_for_file: use_build_context_synchronously

import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/application/pages/yield_prediction/provider/yield_provider.dart';
import 'package:farmer_assistance/application/pages/yield_prediction/widgets/yield_form_card.dart';
import 'package:farmer_assistance/application/pages/yield_prediction/widgets/yield_header_card.dart';
import 'package:farmer_assistance/application/pages/yield_prediction/widgets/yield_result_card.dart';
import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YieldPredictionPage extends ConsumerWidget {
  const YieldPredictionPage({super.key});

  void _applyWeatherData(
    WidgetRef ref,
    Map<String, dynamic> weather, {
    required bool force,
  }) {
    final current = weather['current'] as Map<String, dynamic>?;
    final daily = weather['daily'] as Map<String, dynamic>?;
    final temperatureController = ref.read(yieldTemperatureControllerProvider);
    final rainfallController = ref.read(yieldRainfallControllerProvider);

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
      ref.read(yieldWeatherAutofilledProvider.notifier).markAutofilled();
      ref
          .read(yieldWeatherSourceLabelProvider.notifier)
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
          content: Text('Rainfall and temperature updated from live weather.'),
        ),
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to fetch weather right now.')),
      );
    }
  }

  String? _requiredNumber(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (double.tryParse(value.trim()) == null) {
      return 'Enter a valid number for $fieldName';
    }
    return null;
  }

  void _predictYield(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
  ) {
    final selectedCrop = ref.read(yieldSelectedCropProvider);
    final selectedArea = ref.read(yieldSelectedAreaProvider);

    if (selectedCrop == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a crop')));
      return;
    }

    if (selectedArea == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a location')));
      return;
    }

    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    final rainfall = double.parse(
      ref.read(yieldRainfallControllerProvider).text.trim(),
    );
    final temperature = double.parse(
      ref.read(yieldTemperatureControllerProvider).text.trim(),
    );
    final pesticide = double.parse(
      ref.read(yieldPesticideControllerProvider).text.trim(),
    );

    // Simple area factor based on location (can be customized)
    final areaFactor = 1.0;

    final estimatedYield =
        (areaFactor * 38) +
        (rainfall * 2.7) +
        ((32 - (temperature - 26).abs()) * 42) -
        (pesticide * 1.3);

    ref
        .read(yieldProvider.notifier)
        .setYield(estimatedYield.clamp(500, 12000).toDouble());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(yieldFormKeyProvider);
    final weatherAsync = ref.watch(weatherProvider);
    final yield = ref.watch(yieldProvider);
    final selectedCrop = ref.watch(yieldSelectedCropProvider);
    final selectedArea = ref.watch(yieldSelectedAreaProvider);
    final rainfallController = ref.watch(yieldRainfallControllerProvider);
    final tempController = ref.watch(yieldTemperatureControllerProvider);
    final pesticideController = ref.watch(yieldPesticideControllerProvider);
    final weatherSourceLabel = ref.watch(yieldWeatherSourceLabelProvider);
    final textTheme = Theme.of(context).textTheme;

    // Define crop and area options
    final crops = [
      'Cassava',
      'Maize',
      'Plantains and others',
      'Potatoes',
      'Rice, paddy',
      'Sorghum',
      'Soybeans',
      'Sweet potatoes',
      'Wheat',
      'Yams'
    ];

    final areas = [
      'Albania',
      'Algeria',
      'Angola',
      'Argentina',
      'Armenia',
      'Australia',
      'Austria',
      'Azerbaijan',
      'Bahamas',
      'Bahrain',
      'Bangladesh',
      'Belarus',
      'Belgium',
      'Botswana',
      'Brazil',
      'Bulgaria',
      'Burkina Faso',
      'Burundi',
      'Cameroon',
      'Canada',
      'Central African Republic',
      'Chile',
      'Colombia',
      'Croatia',
      'Denmark',
      'Dominican Republic',
      'Ecuador',
      'Egypt',
      'El Salvador',
      'Eritrea',
      'Estonia',
      'Finland',
      'France',
      'Germany',
      'Ghana',
      'Greece',
      'Guatemala',
      'Guinea',
      'Guyana',
      'Haiti',
      'Honduras',
      'Hungary',
      'India',
      'Indonesia',
      'Iraq',
      'Ireland',
      'Italy',
      'Jamaica',
      'Japan',
      'Kazakhstan',
      'Kenya',
      'Latvia',
      'Lebanon',
      'Lesotho',
      'Libya',
      'Lithuania',
      'Madagascar',
      'Malawi',
      'Malaysia',
      'Mali',
      'Mauritania',
      'Mauritius',
      'Mexico',
      'Montenegro',
      'Morocco',
      'Mozambique',
      'Namibia',
      'Nepal',
      'Netherlands',
      'New Zealand',
      'Nicaragua',
      'Niger',
      'Norway',
      'Pakistan',
      'Papua New Guinea',
      'Peru',
      'Poland',
      'Portugal',
      'Qatar',
      'Romania',
      'Rwanda',
      'Saudi Arabia',
      'Senegal',
      'Slovenia',
      'South Africa',
      'Spain',
      'Sri Lanka',
      'Sudan',
      'Suriname',
      'Sweden',
      'Switzerland',
      'Tajikistan',
      'Thailand',
      'Tunisia',
      'Turkey',
      'Uganda',
      'Ukraine',
      'United Kingdom',
      'Uruguay',
      'Zambia',
      'Zimbabwe'
    ];

    ref.listen<AsyncValue<Map<String, dynamic>>>(weatherProvider, (prev, next) {
      next.whenData((weather) {
        if (!ref.read(yieldWeatherAutofilledProvider)) {
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
        title: const Text('Yield Prediction'),
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
                  YieldHeaderCard(
                    subtitleStyle: textTheme.bodyMedium,
                    hasWeather: weatherAsync.hasValue,
                    weatherSourceLabel: weatherSourceLabel,
                  ),
                  const SizedBox(height: 16),
                  YieldFormCard(
                    selectedCrop: selectedCrop,
                    selectedArea: selectedArea,
                    crops: crops,
                    areas: areas,
                    onCropChanged: (value) {
                      ref
                          .read(yieldSelectedCropProvider.notifier)
                          .setCrop(value);
                    },
                    onAreaChanged: (value) {
                      ref
                          .read(yieldSelectedAreaProvider.notifier)
                          .setArea(value);
                    },
                    rainfallController: rainfallController,
                    temperatureController: tempController,
                    pesticideController: pesticideController,
                    requiredNumber: _requiredNumber,
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
                    child: ElevatedButton(
                      onPressed: () => _predictYield(context, ref, formKey),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 52),
                        backgroundColor: WaterPredictionTheme.primaryTeal,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Predict Yield',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (yield != null)
                    YieldResultCard(predictedYield: yield.toDouble()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
