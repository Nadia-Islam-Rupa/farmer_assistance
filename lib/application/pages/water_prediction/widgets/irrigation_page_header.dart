import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class IrrigationPageHeader extends StatelessWidget {
  const IrrigationPageHeader({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            WaterPredictionTheme.primaryTeal,
            WaterPredictionTheme.deepTeal,
          ],
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
          const Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Color(0x33FFFFFF),
                child: Icon(
                  Icons.water_drop,
                  color: Color(0xffFFECB3),
                  size: 18,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Irrigation Planner',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Select crop details and use real-time weather to prepare backend-ready irrigation input.',
            style: textTheme.bodyMedium?.copyWith(
              color: const Color(0xffD9F5EE),
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
