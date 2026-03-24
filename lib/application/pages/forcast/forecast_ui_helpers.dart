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
