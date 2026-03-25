import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class ForecastHeroHeader extends StatelessWidget {
  const ForecastHeroHeader({
    super.key,
    required this.locationLabel,
    required this.coordinateLabel,
  });

  final String locationLabel;
  final String coordinateLabel;

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
              WaterPredictionTheme.primaryTeal.withOpacity(0.08),
              Colors.white,
            ],
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: WaterPredictionTheme.primaryTeal.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.wb_sunny_outlined,
                color: Colors.orange,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Weather Forecast',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: WaterPredictionTheme.deepTeal,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Real-time weather data for your location',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: WaterPredictionTheme.primaryTeal,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '$locationLabel • $coordinateLabel',
                          style: const TextStyle(
                            fontSize: 11,
                            color: WaterPredictionTheme.primaryTeal,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
