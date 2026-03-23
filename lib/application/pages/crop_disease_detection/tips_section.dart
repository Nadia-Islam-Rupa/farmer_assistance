import 'package:flutter/material.dart';

class TipsSection extends StatelessWidget {
  const TipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xff26A69A).withOpacity(0.15),
                radius: 20,
                child: const Icon(
                  Icons.lightbulb_outline_rounded,
                  color: Color(0xff00796B),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Tips for Best Results',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Follow these guidelines for accurate detection',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
          const SizedBox(height: 20),
          const TipItem(
            icon: Icons.wb_sunny_rounded,
            title: 'Good Lighting',
            description:
                'Take photos in natural light or well-lit conditions',
          ),
          const SizedBox(height: 14),
          const TipItem(
            icon: Icons.center_focus_strong_rounded,
            title: 'Clear Focus',
            description: 'Ensure the affected area is sharp and in focus',
          ),
          const SizedBox(height: 14),
          const TipItem(
            icon: Icons.crop_square_rounded,
            title: 'Close-up Shot',
            description: 'Fill the frame with the leaf showing symptoms',
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xff26A69A).withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xff00796B), size: 24),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
