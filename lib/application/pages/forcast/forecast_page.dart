import 'package:farmer_assistance/application/pages/forcast/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ForecastPage extends ConsumerWidget {
  const ForecastPage({super.key});

  // ⏰ Format Time
  String formatTime(String time) {
    DateTime dt = DateTime.parse(time);
    return DateFormat('hh:mm a').format(dt);
  }

  // 📅 Format Day
  String formatDay(String time) {
    DateTime dt = DateTime.parse(time);
    return DateFormat('EEE').format(dt);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        backgroundColor: const Color(0xff00796B),
      ),
      backgroundColor: Colors.grey[100],

      body: weatherAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) => Center(child: Text("Error: $e")),

        data: (data) {
          final current = data['current'];
          final hourly = data['hourly'];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // 🌦 CURRENT WEATHER CARD
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff00796B), Color(0xff26A69A)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${current['temperature_2m']}°C",
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Feels like ${current['apparent_temperature']}°C",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _stat(
                            Icons.water_drop,
                            "Humidity",
                            "${current['relative_humidity_2m']}%",
                          ),
                          _stat(
                            Icons.air,
                            "Wind",
                            "${current['wind_speed_10m']} km/h",
                          ),
                          _stat(
                            Icons.umbrella,
                            "Rain",
                            "${current['rain']} mm",
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _stat(
                            Icons.cloud,
                            "Cloud",
                            "${current['cloud_cover']}%",
                          ),
                          _stat(
                            Icons.flash_on,
                            "Gust",
                            "${current['wind_gusts_10m']} km/h",
                          ),
                          _stat(
                            Icons.explore,
                            "Dir",
                            "${current['wind_direction_10m']}°",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ⏰ FORECAST LIST
                Expanded(
                  child: ListView.builder(
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      if (index % 2 != 0) return const SizedBox();

                      final time = hourly['time'][index];
                      final temp = hourly['temperature_2m'][index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // 📅 Day + Time
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formatDay(time),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  formatTime(time),
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),

                            // 🌡 Temp
                            Text(
                              "${temp.toStringAsFixed(1)}°C",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 📊 Stat Widget
  Widget _stat(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70)),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
