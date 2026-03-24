import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/application/pages/forcast/weekly_fore.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/current_weather_summary_card.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/next_hours_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForecastPage extends ConsumerWidget {
  const ForecastPage({super.key});

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

          final List<dynamic> hourlyTimes =
              (hourly['time'] as List<dynamic>? ?? <dynamic>[]);
          final List<dynamic> hourlyTemps =
              (hourly['temperature_2m'] as List<dynamic>? ?? <dynamic>[]);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CurrentWeatherSummaryCard(current: current),
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeeklyForecastPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xff00796B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.calendar_month),
                  label: const Text(
                    'View 7-Day Forecast',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 20),
                NextHoursSection(
                  hourlyTimes: hourlyTimes,
                  hourlyTemps: hourlyTemps,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
