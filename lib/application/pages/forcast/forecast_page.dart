import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/current_weather_summary_card.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/forecast_error_state.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/forecast_hero_header.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/forecast_loading_state.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/next_hours_section.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/weekly_forecast_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForecastPage extends ConsumerWidget {
  const ForecastPage({super.key});

  Future<void> _refreshWeather(WidgetRef ref) async {
    ref.invalidate(weatherProvider);
    await ref.read(weatherProvider.future);
  }

  double? _asDouble(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(value?.toString() ?? '');
  }

  String _coordinatesText(Map<String, dynamic>? data) {
    if (data == null) {
      return 'Lat: --, Lon: --';
    }

    final lat = _asDouble(data['_latitude']);
    final lon = _asDouble(data['_longitude']);

    if (lat == null || lon == null) {
      return 'Lat: --, Lon: --';
    }

    return 'Lat: ${lat.toStringAsFixed(2)}, Lon: ${lon.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);
    final weatherData = weatherAsync.maybeWhen(
      data: (data) => data,
      orElse: () => null,
    );
    final locationLabel =
        weatherData?['_locationLabel']?.toString() ?? 'Bangladesh';
    final coordinateLabel = _coordinatesText(weatherData);

    return Scaffold(
      backgroundColor: const Color(0xffF1FAF8),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff26A69A),
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          'Weather Forecast',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffD7F2EE), Color(0xffF3FBF9)],
            stops: [0.0, 0.45],
          ),
        ),
        child: SafeArea(
          child: weatherAsync.when(
            loading: () => const ForecastLoadingState(),
            error: (e, _) => ForecastErrorState(
              message: e.toString(),
              onRetry: () => _refreshWeather(ref),
            ),
            data: (data) {
              final current = data['current'];
              final hourly = data['hourly'];

              final List<dynamic> hourlyTimes =
                  (hourly['time'] as List<dynamic>? ?? <dynamic>[]);
              final List<dynamic> hourlyTemps =
                  (hourly['temperature_2m'] as List<dynamic>? ?? <dynamic>[]);

              return RefreshIndicator(
                color: Color(0xff26A69A),
                onRefresh: () => _refreshWeather(ref),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ForecastHeroHeader(
                        locationLabel: locationLabel,
                        coordinateLabel: coordinateLabel,
                      ),
                      const SizedBox(height: 16),
                      CurrentWeatherSummaryCard(current: current),
                      const SizedBox(height: 16),
                      const WeeklyForecastButton(),
                      const SizedBox(height: 18),
                      NextHoursSection(
                        hourlyTimes: hourlyTimes,
                        hourlyTemps: hourlyTemps,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
