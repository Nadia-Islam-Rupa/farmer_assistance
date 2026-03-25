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
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              WaterPredictionTheme.primaryTeal.withValues(alpha: 0.08),
              Colors.white,
            ],
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: WaterPredictionTheme.primaryTeal.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.agriculture_outlined,
                color: WaterPredictionTheme.deepTeal,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Yield Prediction',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: WaterPredictionTheme.deepTeal,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Estimate your crop yield based on conditions',
                    style:
                        subtitleStyle?.copyWith(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ) ??
                        TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                  if (hasWeather) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.cloud_done_outlined,
                          size: 14,
                          color: WaterPredictionTheme.primaryTeal,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            weatherSourceLabel,
                            style: const TextStyle(
                              fontSize: 11,
                              color: WaterPredictionTheme.primaryTeal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
