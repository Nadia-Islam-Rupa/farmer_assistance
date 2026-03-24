import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

// Provider
final weatherProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final dio = Dio();

  const url =
      'https://api.open-meteo.com/v1/forecast?latitude=23.99&longitude=90.52'
      '&current=temperature_2m,relative_humidity_2m,rain,precipitation,apparent_temperature,weather_code,cloud_cover,wind_gusts_10m,wind_direction_10m,wind_speed_10m'
      '&hourly=temperature_2m'
      '&daily=temperature_2m_max,temperature_2m_min,precipitation_sum'
      '&forecast_days=7'
      '&timezone=Asia/Dhaka';

  final response = await dio.get(url);

  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception("Failed to load weather");
  }
});
