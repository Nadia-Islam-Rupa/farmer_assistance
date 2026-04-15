import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class WeeklyForecastPage extends ConsumerWidget {
  const WeeklyForecastPage({super.key});

  String getDay(String date) {
    DateTime dt = DateTime.parse(date);
    return DateFormat('EEEE').format(dt); // Monday
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "7-Day Forecast",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppTheme.primaryTeal,
      ),
      backgroundColor: AppTheme.backgroundColor,

      body: weatherAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) => Center(child: Text("Error: $e")),

        data: (data) {
          final daily = data['daily'];

          if (daily == null || daily['time'] == null) {
            return const Center(
              child: Text('Weekly forecast data is not available right now.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: daily['time'].length,
            itemBuilder: (context, index) {
              final date = daily['time'][index];
              final maxTemp = daily['temperature_2m_max'][index];
              final minTemp = daily['temperature_2m_min'][index];
              final rain = daily['precipitation_sum'][index];

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 4),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 📅 Day
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getDay(date),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(date, style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),

                    // 🌡 Temp
                    Column(
                      children: [
                        Text(
                          "Max: ${maxTemp.toStringAsFixed(1)}°C",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Min: ${minTemp.toStringAsFixed(1)}°C",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),

                    // 🌧 Rain
                    Column(
                      children: [
                        const Icon(Icons.umbrella, color: Colors.blue),
                        Text("$rain mm"),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
