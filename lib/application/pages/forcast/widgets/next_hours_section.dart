import 'dart:math' as math;

import 'package:farmer_assistance/application/pages/forcast/forecast_ui_helpers.dart';
import 'package:flutter/material.dart';

class NextHoursSection extends StatelessWidget {
  const NextHoursSection({
    super.key,
    required this.hourlyTimes,
    required this.hourlyTemps,
  });

  final List<dynamic> hourlyTimes;
  final List<dynamic> hourlyTemps;

  @override
  Widget build(BuildContext context) {
    final safeHourlyCount = math.min(hourlyTimes.length, hourlyTemps.length);
    final displayCount = math.min(safeHourlyCount, 12);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.schedule, color: Color(0xff26A69A)),
            SizedBox(width: 8),
            Text(
              'Next Hours',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff1F5F58),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (displayCount == 0)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text('No hourly forecast available.'),
          )
        else
          SizedBox(
            height: 156,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: displayCount,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final time = hourlyTimes[index].toString();
                final temp = hourlyTemps[index];

                return _NextHourCard(time: time, temp: temp);
              },
            ),
          ),
      ],
    );
  }
}

class _NextHourCard extends StatelessWidget {
  const _NextHourCard({required this.time, required this.temp});

  final String time;
  final dynamic temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffE3F7F4), Color(0xffD3F1EC)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff8BD8CF), width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2626A69A),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            formatHourlyDay(time),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xff1F7D74),
            ),
          ),
          Text(
            formatHourlyTime(time),
            style: const TextStyle(
              color: Color(0xff2A9388),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              color: Color(0xffBEEBE6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.thermostat,
              color: Color(0xffFF9800),
              size: 20,
            ),
          ),
          Text(
            '${formatTemperature(temp)}°C',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xff1B6158),
            ),
          ),
        ],
      ),
    );
  }
}
