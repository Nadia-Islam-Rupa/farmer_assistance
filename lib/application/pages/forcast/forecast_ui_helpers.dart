import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatHourlyTime(String time) {
  final dt = DateTime.parse(time);
  return DateFormat('hh:mm a').format(dt);
}

String formatHourlyDay(String time) {
  final dt = DateTime.parse(time);
  return DateFormat('EEE').format(dt);
}

String formatTemperature(dynamic value) {
  if (value is num) return value.toStringAsFixed(1);
  final parsed = double.tryParse('$value');
  if (parsed != null) return parsed.toStringAsFixed(1);
  return '$value';
}

IconData weatherIconFromCode(int? code) {
  if (code == null) return Icons.cloud;
  if (code == 0) return Icons.wb_sunny;
  if (code <= 3) return Icons.cloud;
  if (code == 45 || code == 48) return Icons.foggy;
  if (code >= 51 && code <= 67) return Icons.grain;
  if (code >= 71 && code <= 77) return Icons.ac_unit;
  if (code >= 80 && code <= 82) return Icons.umbrella;
  if (code >= 95) return Icons.thunderstorm;
  return Icons.cloud;
}

Color weatherIconColorFromCode(int? code) {
  if (code == null) return const Color(0xffCFD8DC);
  if (code == 0) return const Color(0xffFFB300);
  if (code == 1 || code == 2) return const Color(0xffFFD54F);
  if (code == 3) return const Color(0xffB0BEC5);
  if (code == 45 || code == 48) return const Color(0xff90A4AE);
  if (code >= 51 && code <= 67) return const Color(0xff4FC3F7);
  if (code >= 71 && code <= 77) return const Color(0xff81D4FA);
  if (code >= 80 && code <= 82) return const Color(0xff29B6F6);
  if (code >= 95) return const Color(0xffFFD740);
  return const Color(0xffCFD8DC);
}

String weatherLabelFromCode(int? code) {
  if (code == null) return 'Weather';
  if (code == 0) return 'Clear sky';
  if (code == 1 || code == 2) return 'Partly cloudy';
  if (code == 3) return 'Overcast';
  if (code == 45 || code == 48) return 'Fog';
  if (code >= 51 && code <= 67) return 'Drizzle/Rain';
  if (code >= 71 && code <= 77) return 'Snow';
  if (code >= 80 && code <= 82) return 'Rain showers';
  if (code >= 95) return 'Thunderstorm';
  return 'Weather';
}
