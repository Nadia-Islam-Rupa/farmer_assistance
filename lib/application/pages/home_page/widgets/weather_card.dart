import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../utils/utils.dart';
import '../../forcast/provider/weather_service.dart';

class WeatherCard extends ConsumerWidget {
  const WeatherCard({super.key});

  IconData _getWeatherIcon(int weatherCode) {
    // WMO Weather interpretation codes
    if (weatherCode == 0) return Icons.wb_sunny; // Clear sky
    if (weatherCode >= 1 && weatherCode <= 3) {
      return Icons.wb_cloudy; // Partly cloudy
    }
    if (weatherCode >= 45 && weatherCode <= 48) return Icons.foggy; // Fog
    if (weatherCode >= 51 && weatherCode <= 67) return Icons.grain; // Rain
    if (weatherCode >= 71 && weatherCode <= 77) return Icons.ac_unit; // Snow
    if (weatherCode >= 80 && weatherCode <= 99) {
      return Icons.thunderstorm; // Thunderstorm
    }
    return Icons.wb_sunny_outlined;
  }

  String _getWeatherDescription(int weatherCode) {
    if (weatherCode == 0) return 'Clear';
    if (weatherCode >= 1 && weatherCode <= 3) return 'Cloudy';
    if (weatherCode >= 45 && weatherCode <= 48) return 'Foggy';
    if (weatherCode >= 51 && weatherCode <= 67) return 'Rainy';
    if (weatherCode >= 71 && weatherCode <= 77) return 'Snowy';
    if (weatherCode >= 80 && weatherCode <= 99) return 'Stormy';
    return 'Clear';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff00796B), // Deep Teal
            Color(0xff26A69A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: weatherAsync.when(
        data: (weather) {
          final current = weather['current'] as Map<String, dynamic>?;
          final temperature =
              (current?['temperature_2m'] as num?)?.round() ?? 0;
          final humidity =
              (current?['relative_humidity_2m'] as num?)?.round() ?? 0;
          final windSpeed = (current?['wind_speed_10m'] as num?)?.round() ?? 0;
          final weatherCode = (current?['weather_code'] as num?)?.toInt() ?? 0;

          return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting
                Text(
                  Utils.getGreeting(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('MMMM dd, yyyy').format(DateTime.now()),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 18),

                // Weather row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Temperature box
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal.shade200,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(
                              _getWeatherIcon(weatherCode),
                              color: Colors.white,
                              size: 26,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '$temperature°C\n${_getWeatherDescription(weatherCode)}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Humidity box
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal.shade200,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Humidity: $humidity%\nWind: $windSpeed km/h',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            height: 1.2,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
        loading: () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils.getGreeting(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat('MMMM dd, yyyy').format(DateTime.now()),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade200,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Loading...',
                          style: TextStyle(color: Colors.white, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade200,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Loading...',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, height: 1.2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
        error: (error, stack) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils.getGreeting(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat('MMMM dd, yyyy').format(DateTime.now()),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade200,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '--°C\nN/A',
                          style: TextStyle(color: Colors.white, height: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade200,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Weather unavailable',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, height: 1.2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
