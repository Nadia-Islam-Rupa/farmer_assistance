import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class YieldHeaderCard extends StatelessWidget {
  const YieldHeaderCard({
    super.key,
    required this.subtitleStyle,
    required this.hasWeather,
    required this.weatherSourceLabel,
  });

  final TextStyle? subtitleStyle;
  final bool hasWeather;
  final String weatherSourceLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            WaterPredictionTheme.primaryTeal,
            WaterPredictionTheme.deepTeal,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Smart Yield Assistant',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Enter crop details and use live weather values for better estimates.',
            style: subtitleStyle?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.white70),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  hasWeather
                      ? weatherSourceLabel
                      : 'Fetching weather source...',
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
