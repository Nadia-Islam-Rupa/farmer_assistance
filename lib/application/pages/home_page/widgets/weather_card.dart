import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/utils.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff00796B), // Deep Teal
            Color(0xff26A69A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          Text(
            Utils.getGreeting(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            DateFormat('MMMM dd, yyyy').format(DateTime.now()),
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 18),

          // Weather row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Temperature box
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "28°C\nSunny",
                        style: TextStyle(color: Colors.white, height: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Humidity box
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Humidity: 65%\nWind: 12 km/h",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, height: 1.2),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
