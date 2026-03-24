import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/application/pages/forcast/weekly_fore.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/current_weather_summary_card.dart';
import 'package:farmer_assistance/application/pages/forcast/widgets/next_hours_section.dart';
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
        backgroundColor: Color(0xff26A69A),
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weather Forecast',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 2),
            Text(
              locationLabel,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xffCDEEE7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //     tooltip: 'Refresh weather',
        //     onPressed: () => _refreshWeather(ref),
        //     icon: const Icon(Icons.refresh_rounded),
        //   ),
        //   const SizedBox(width: 6),
        // ],
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
            loading: () => const _LoadingState(),
            error: (e, _) => _ErrorState(
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
                      _ForecastHeroHeader(
                        locationLabel: locationLabel,
                        coordinateLabel: coordinateLabel,
                      ),
                      const SizedBox(height: 16),
                      CurrentWeatherSummaryCard(current: current),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1A26A69A),
                              blurRadius: 18,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const WeeklyForecastPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 52),
                            elevation: 0,
                            backgroundColor: const Color(0xff26A69A),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          icon: const Icon(Icons.calendar_month),
                          label: const Text(
                            'View 7-Day Forecast',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
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

class _ForecastHeroHeader extends StatelessWidget {
  const _ForecastHeroHeader({
    required this.locationLabel,
    required this.coordinateLabel,
  });

  final String locationLabel;
  final String coordinateLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff26A69A), Color(0xff1F8E84)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2426A69A),
            blurRadius: 18,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0x33FFFFFF),
                child: Icon(Icons.wb_sunny_outlined, color: Color(0xffFFB300)),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Today\'s Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xffFFE082),
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                locationLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Swipe down to refresh. Forecast is now fetched by your live location when permission is granted.',
            style: const TextStyle(
              color: Color(0xffD9F5EE),
              fontSize: 13,
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.explore_outlined,
                color: Color(0xffFFCC80),
                size: 15,
              ),
              const SizedBox(width: 6),
              Text(
                coordinateLabel,
                style: const TextStyle(
                  color: Color(0xffCBEDE6),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1F26A69A),
                  blurRadius: 14,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: const CircularProgressIndicator(
              color: Color(0xff26A69A),
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Loading latest weather...',
            style: TextStyle(
              color: Color(0xff2F6F69),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xffBEE6E1)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.cloud_off_rounded,
                color: Color(0xff3A8981),
                size: 36,
              ),
              const SizedBox(height: 10),
              const Text(
                'Unable to load weather data',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1D5751),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xff26A69A), fontSize: 13),
              ),
              const SizedBox(height: 14),
              FilledButton.icon(
                onPressed: onRetry,
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xff26A69A),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
