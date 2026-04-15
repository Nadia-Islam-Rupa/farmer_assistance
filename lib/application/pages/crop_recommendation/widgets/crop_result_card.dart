import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/constants/crop_constants.dart';
import 'package:farmer_assistance/domain/models/Crop_recommendation_response_model.dart';
import 'package:flutter/material.dart';

class CropResultCard extends StatelessWidget {
  final CropRecommendationResponseModel result;

  const CropResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryTeal.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  CropConstants.getCropEmoji(result.crop!),
                  style: const TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommended Crop',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      result.crop!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Confidence indicator
          if (result.confidence! > 0) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.lightGreenAccent,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Confidence: ${(result.confidence! * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Tips section
          // if (result.tips.isNotEmpty) ...[
          //   const SizedBox(height: 20),
          //   const Divider(color: Colors.white38, thickness: 1),
          //   const SizedBox(height: 12),
          //   const Text(
          //     'Growing Tips',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   const SizedBox(height: 12),
          //   ...result.tips.asMap().entries.map((entry) {
          //     return Padding(
          //       padding: const EdgeInsets.only(bottom: 10),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Container(
          //             margin: const EdgeInsets.only(top: 4),
          //             width: 6,
          //             height: 6,
          //             decoration: const BoxDecoration(
          //               color: Colors.lightGreenAccent,
          //               shape: BoxShape.circle,
          //             ),
          //           ),
          //           const SizedBox(width: 12),
          //           Expanded(
          //             child: Text(
          //               entry.value,
          //               style: const TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 14,
          //                 height: 1.5,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   }),
          // ],
        ],
      ),
    );
  }
}
