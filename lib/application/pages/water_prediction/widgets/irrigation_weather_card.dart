import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IrrigationWeatherCard extends StatelessWidget {
  const IrrigationWeatherCard({
    super.key,
    required this.weatherAsync,
    required this.textTheme,
  });

  final AsyncValue<Map<String, dynamic>> weatherAsync;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return weatherAsync.when(
      data: (weather) {
        final current = weather['current'] as Map<String, dynamic>?;
        final temperature = current?['temperature_2m']?.toString() ?? '--';
        final humidity = current?['relative_humidity_2m']?.toString() ?? '--';
        final rain = current?['rain']?.toString() ?? '--';

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1426A69A),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xffE0F2F1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.cloud_outlined,
                      color: WaterPredictionTheme.deepTeal,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Current Weather',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff174A44),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _MetricTile(
                      icon: Icons.thermostat,
                      label: 'Temperature',
                      value: '$temperature C',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _MetricTile(
                      icon: Icons.water_drop_outlined,
                      label: 'Humidity',
                      value: '$humidity %',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _MetricTile(
                      icon: Icons.grain,
                      label: 'Rain',
                      value: '$rain mm',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      loading: () => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: WaterPredictionTheme.primaryTeal,
          ),
        ),
      ),
      error: (e, _) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffFFF3F2),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xffF9C6C2)),
        ),
        child: const Row(
          children: [
            Icon(Icons.error_outline, color: Color(0xffC62828)),
            SizedBox(width: 10),
            Expanded(child: Text('Unable to load weather data')),
          ],
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffF2FBF9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: WaterPredictionTheme.deepTeal),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff5D7D78),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xff174A44),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
