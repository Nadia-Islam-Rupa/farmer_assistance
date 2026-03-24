import 'package:farmer_assistance/application/pages/forcast/forecast_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentWeatherSummaryCard extends StatelessWidget {
  const CurrentWeatherSummaryCard({super.key, required this.current});

  final Map<String, dynamic> current;

  @override
  Widget build(BuildContext context) {
    final weatherCode = current['weather_code'] as int?;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff1F8E84), Color(0xff26A69A)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                weatherIconFromCode(weatherCode),
                color: weatherIconColorFromCode(weatherCode),
                size: 26,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  weatherLabelFromCode(weatherCode),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                DateFormat('EEE, dd MMM').format(DateTime.now()),
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '${formatTemperature(current['temperature_2m'])}°C',
            style: const TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Feels like ${formatTemperature(current['apparent_temperature'])}°C',
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _MetricChip(
                icon: Icons.water_drop,
                label: 'Humidity',
                value: '${current['relative_humidity_2m']}%',
                iconColor: const Color(0xff7FDBFF),
              ),
              _MetricChip(
                icon: Icons.air,
                label: 'Wind',
                value: '${current['wind_speed_10m']} km/h',
                iconColor: const Color(0xffB3E5FC),
              ),
              _MetricChip(
                icon: Icons.umbrella,
                label: 'Rain',
                value: '${current['rain']} mm',
                iconColor: const Color(0xff4FC3F7),
              ),
              _MetricChip(
                icon: Icons.cloud,
                label: 'Cloud',
                value: '${current['cloud_cover']}%',
                iconColor: const Color(0xffCFD8DC),
              ),
              _MetricChip(
                icon: Icons.flash_on,
                label: 'Gust',
                value: '${current['wind_gusts_10m']} km/h',
                iconColor: const Color(0xffFFE082),
              ),
              _MetricChip(
                icon: Icons.explore,
                label: 'Direction',
                value: '${current['wind_direction_10m']}°',
                iconColor: const Color(0xffFFCC80),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 16),
          const SizedBox(width: 6),
          Text(
            '$label: $value',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
