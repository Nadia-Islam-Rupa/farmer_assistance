import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ForecastLoadingState extends StatelessWidget {
  const ForecastLoadingState({super.key});

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
              color: AppTheme.lightTeal,
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
