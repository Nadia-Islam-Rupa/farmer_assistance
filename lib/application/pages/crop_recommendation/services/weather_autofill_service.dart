import 'package:farmer_assistance/application/pages/crop_recommendation/providers/crop_recommendation_provider.dart';
import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service for handling automatic weather data filling in crop recommendation
class WeatherAutofillService {
  final WidgetRef ref;

  WeatherAutofillService(this.ref);

  /// Initialize auto-fill by checking if weather data should be applied
  void initializeAutofill() {
    final weatherAsync = ref.read(weatherProvider);
    weatherAsync.whenData((weather) {
      if (!ref.read(cropWeatherAutofilledProvider)) {
        applyWeatherData(weather, force: false);
      }
    });
  }

  /// Apply weather data to form controllers
  ///
  /// [weather] - Weather data map containing current conditions
  /// [force] - If true, overwrites existing values. If false, only fills empty fields.
  void applyWeatherData(Map<String, dynamic> weather, {required bool force}) {
    final current = weather['current'] as Map<String, dynamic>?;
    final temperatureController = ref.read(cropTemperatureControllerProvider);
    final humidityController = ref.read(cropHumidityControllerProvider);
    final rainfallController = ref.read(cropRainfallControllerProvider);

    final currentTemp = (current?['temperature_2m'] as num?)?.toDouble();
    final currentHumidity = (current?['relative_humidity_2m'] as num?)
        ?.toDouble();
    final currentRainfall = (current?['rain'] as num?)?.toDouble();

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

    if (currentRainfall != null &&
        (force || rainfallController.text.trim().isEmpty)) {
      rainfallController.text = currentRainfall.toStringAsFixed(1);
      hasChanges = true;
    }

    if (hasChanges) {
      ref.read(cropWeatherAutofilledProvider.notifier).markAutofilled();
      ref
          .read(cropWeatherSourceLabelProvider.notifier)
          .setLabel(weather['_locationLabel']?.toString() ?? 'Live weather');
    }
  }

  /// Fetch and apply latest weather data, with force override
  Future<void> refreshWeatherData() async {
    final weather = await ref.read(weatherProvider.future);
    applyWeatherData(weather, force: true);
  }
}
