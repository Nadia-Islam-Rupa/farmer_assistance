import 'package:flutter/material.dart';

class CropHeaderCard extends StatelessWidget {
  final TextStyle? subtitleStyle;
  final bool hasWeather;
  final String weatherSourceLabel;

  const CropHeaderCard({
    super.key,
    this.subtitleStyle,
    required this.hasWeather,
    required this.weatherSourceLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff00796B), Color(0xff26A69A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff00796B).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.grass, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Crop Recommendation',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Get personalized crop recommendations based on your soil nutrients and local weather conditions.',
            style:
                subtitleStyle?.copyWith(
                  color: Colors.white.withValues(alpha: 0.95),
                  height: 1.4,
                ) ??
                TextStyle(
                  color: Colors.white.withValues(alpha: 0.95),
                  fontSize: 14,
                  height: 1.4,
                ),
          ),
          if (hasWeather) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.lightGreenAccent.shade400,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Weather data from: $weatherSourceLabel',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
