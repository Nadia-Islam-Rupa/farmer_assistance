import 'package:flutter/material.dart';

class TipsSection extends StatelessWidget {
  const TipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE6F9F2), Color(0xFFF8FFFB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'Tips for Best Results',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Follow these guidelines to get accurate disease detection',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              TipItem(
                icon: Icons.wb_sunny_rounded,
                title: 'Good Lighting',
                description:
                    'Take photos in natural light or well-lit conditions',
              ),
              TipItem(
                icon: Icons.center_focus_strong_rounded,
                title: 'Clear Focus',
                description: 'Ensure the affected area is sharp and in focus',
              ),
              TipItem(
                icon: Icons.crop_square_rounded,
                title: 'Close-up Shot',
                description: 'Fill the frame with the leaf showing symptoms',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//////////////////////////

class TipItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const TipItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF00B894), size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
