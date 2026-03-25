import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class YieldResultCard extends StatelessWidget {
  const YieldResultCard({super.key, required this.predictedYield});

  final double predictedYield;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: const BoxDecoration(
                color: Color(0xffE4F7F3),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.auto_graph_rounded,
                color: WaterPredictionTheme.deepTeal,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Predicted Yield',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${predictedYield.toStringAsFixed(2)} hg/ha',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: WaterPredictionTheme.deepTeal,
                    ),
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
