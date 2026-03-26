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
      ).timeout(const Duration(seconds: 5));

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final parts = <String>[];

        // Helper to check if string is valid
        bool isValid(String? str) =>
            str != null && str.trim().isNotEmpty && str.trim() != 'null';

        // Priority order: locality (city) -> subAdministrativeArea (district) -> administrativeArea (division)
        if (isValid(place.locality)) {
          parts.add(place.locality!.trim());
        } else if (isValid(place.subAdministrativeArea)) {
          parts.add(place.subAdministrativeArea!.trim());
        } else if (isValid(place.administrativeArea)) {
          parts.add(place.administrativeArea!.trim());
        }

        // Add subLocality (area/neighborhood) if available and different from locality
        if (isValid(place.subLocality) &&
            (parts.isEmpty || place.subLocality!.trim() != parts.first)) {
          if (parts.isEmpty) {
            parts.add(place.subLocality!.trim());
          } else {
            parts.insert(0, place.subLocality!.trim());
          }
        }

        // Fallback to other fields if still empty
        if (parts.isEmpty) {
          if (isValid(place.name)) {
            parts.add(place.name!.trim());
          } else if (isValid(place.thoroughfare)) {
            parts.add(place.thoroughfare!.trim());
          } else if (isValid(place.country)) {
            parts.add(place.country!.trim());
          }
        }

        if (parts.isNotEmpty) {
          // Remove duplicates while preserving order
          final uniqueParts = <String>[];
          for (final part in parts) {
            if (!uniqueParts.contains(part)) {
              uniqueParts.add(part);
            }
          }
          locationLabel = uniqueParts.join(', ');
        }
      }
    } catch (e) {
      // If geocoding fails, keep the default "Current Location"
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
