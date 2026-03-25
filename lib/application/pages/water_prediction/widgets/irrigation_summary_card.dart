import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class IrrigationSummaryCard extends StatelessWidget {
  const IrrigationSummaryCard({
    super.key,
    required this.textTheme,
    required this.selectedCrop,
    required this.selectedSoil,
    required this.selectedStage,
  });

  final TextTheme textTheme;
  final String? selectedCrop;
  final String? selectedSoil;
  final String? selectedStage;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: WaterPredictionTheme.primaryTeal.withValues(
                      alpha: 0.15,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.summarize_outlined,
                    color: WaterPredictionTheme.deepTeal,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Selected Parameters',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: WaterPredictionTheme.deepTeal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _SummaryRow(
              label: 'Crop',
              value: selectedCrop,
              icon: Icons.eco_outlined,
            ),
            const SizedBox(height: 10),
            _SummaryRow(
              label: 'Soil Type',
              value: selectedSoil,
              icon: Icons.landscape_outlined,
            ),
            const SizedBox(height: 10),
            _SummaryRow(
              label: 'Growth Stage',
              value: selectedStage,
              icon: Icons.spa_outlined,
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 18,
                    color: WaterPredictionTheme.primaryTeal,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Backend model will process these inputs with weather data',
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade700,
                        height: 1.3,
                      ),
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

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String? value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: WaterPredictionTheme.primaryTeal),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            value ?? 'Not selected',
            style: TextStyle(
              color: value != null
                  ? WaterPredictionTheme.deepTeal
                  : Colors.grey.shade500,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
