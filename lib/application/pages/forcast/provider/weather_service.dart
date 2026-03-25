import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

const double _defaultLatitude = 23.8103;
const double _defaultLongitude = 90.4125;

const _ForecastLocation _dhakaFallbackLocation = _ForecastLocation(
  latitude: _defaultLatitude,
  longitude: _defaultLongitude,
  label: 'Dhaka',
  isFallback: true,
);

class _ForecastLocation {
  const _ForecastLocation({
    required this.latitude,
    required this.longitude,
    required this.label,
    required this.isFallback,
  });

  final double latitude;
  final double longitude;
  final String label;
  final bool isFallback;
}

Future<_ForecastLocation> _resolveForecastLocation() async {
  try {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled().timeout(
      const Duration(seconds: 3),
    );
    if (!serviceEnabled) {
      return const _ForecastLocation(
        latitude: _defaultLatitude,
        longitude: _defaultLongitude,
        label: 'Dhaka',
        isFallback: true,
      );
    }

    var permission = await Geolocator.checkPermission().timeout(
      const Duration(seconds: 3),
    );
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission().timeout(
        const Duration(seconds: 6),
      );
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return const _ForecastLocation(
        latitude: _defaultLatitude,
        longitude: _defaultLongitude,
        label: 'Dhaka',
        isFallback: true,
      );
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
        timeLimit: Duration(seconds: 6),
      ),
    ).timeout(const Duration(seconds: 7));

    // Get location name from coordinates using reverse geocoding
    String locationLabel = 'Current Location';
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ).timeout(const Duration(seconds: 4));

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        // Build location name from available components
        final parts = <String>[];

        if (place.locality?.isNotEmpty ?? false) {
          parts.add(place.locality!);
        } else if (place.subAdministrativeArea?.isNotEmpty ?? false) {
          parts.add(place.subAdministrativeArea!);
        }

        if (place.administrativeArea?.isNotEmpty ?? false) {
          parts.add(place.administrativeArea!);
        }

        if (parts.isNotEmpty) {
          locationLabel = parts.join(', ');
        }
      }
    } catch (_) {
      // If geocoding fails, use generic label
      locationLabel = 'Current Location';
    }

    return _ForecastLocation(
      latitude: position.latitude,
      longitude: position.longitude,
      label: locationLabel,
      isFallback: false,
    );
  } catch (e) {
    if (e is TimeoutException) {
      return const _ForecastLocation(
        latitude: _defaultLatitude,
        longitude: _defaultLongitude,
        label: 'Dhaka',
        isFallback: true,
      );
    }

    return const _ForecastLocation(
      latitude: _defaultLatitude,
      longitude: _defaultLongitude,
      label: 'Dhaka',
      isFallback: true,
    );
  }
}

// Provider
final weatherProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 6),
      receiveTimeout: const Duration(seconds: 8),
      sendTimeout: const Duration(seconds: 6),
    ),
  );
  final location = await _resolveForecastLocation();
  var effectiveLocation = location;

  Response<dynamic> response;
  try {
    response = await dio
        .get(
          'https://api.open-meteo.com/v1/forecast',
          queryParameters: {
            'latitude': location.latitude,
            'longitude': location.longitude,
            'current':
                'temperature_2m,relative_humidity_2m,rain,precipitation,apparent_temperature,weather_code,cloud_cover,wind_gusts_10m,wind_direction_10m,wind_speed_10m',
            'hourly': 'temperature_2m',
            'daily': 'temperature_2m_max,temperature_2m_min,precipitation_sum',
            'forecast_days': 7,
            'timezone': 'Asia/Dhaka',
          },
        )
        .timeout(const Duration(seconds: 10));
  } catch (_) {
    // If live-location request fails, retry with stable Dhaka fallback once.
    effectiveLocation = _dhakaFallbackLocation;
    response = await dio
        .get(
          'https://api.open-meteo.com/v1/forecast',
          queryParameters: {
            'latitude': _dhakaFallbackLocation.latitude,
            'longitude': _dhakaFallbackLocation.longitude,
            'current':
                'temperature_2m,relative_humidity_2m,rain,precipitation,apparent_temperature,weather_code,cloud_cover,wind_gusts_10m,wind_direction_10m,wind_speed_10m',
            'hourly': 'temperature_2m',
            'daily': 'temperature_2m_max,temperature_2m_min,precipitation_sum',
            'forecast_days': 7,
            'timezone': 'Asia/Dhaka',
          },
        )
        .timeout(const Duration(seconds: 10));
  }

  if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
    final payload = Map<String, dynamic>.from(
      response.data as Map<String, dynamic>,
    );
    payload['_locationLabel'] = effectiveLocation.label;
    payload['_isFallbackLocation'] = effectiveLocation.isFallback;
    payload['_latitude'] = effectiveLocation.latitude;
    payload['_longitude'] = effectiveLocation.longitude;
    return payload;
  } else {
    throw Exception('Failed to load weather');
  }
});
