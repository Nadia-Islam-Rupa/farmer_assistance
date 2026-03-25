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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff26A69A), Color(0xff1F8E84)],
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
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0x33FFFFFF),
                child: Icon(Icons.wb_sunny_outlined, color: Color(0xffFFB300)),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Today\'s Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xffFFE082),
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                locationLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Swipe down to refresh. Forecast is now fetched by your live location when permission is granted.',
            style: TextStyle(
              color: Color(0xffD9F5EE),
              fontSize: 13,
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.explore_outlined,
                color: Color(0xffFFCC80),
                size: 15,
              ),
              const SizedBox(width: 6),
              Text(
                coordinateLabel,
                style: const TextStyle(
                  color: Color(0xffCBEDE6),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
