import 'package:farmer_assistance/domain/models/Crop_recommendation_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Form key provider
final cropRecommendationFormKeyProvider =
    Provider.autoDispose<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());

// Text editing controllers for soil data
final cropNitrogenControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final cropPhosphorusControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final cropPotassiumControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final cropPhControllerProvider = Provider.autoDispose<TextEditingController>((
  ref,
) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

// Text editing controllers for weather data
final cropTemperatureControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final cropHumidityControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final cropRainfallControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

// Weather auto-fill tracking
final cropWeatherAutofilledProvider =
    NotifierProvider<CropWeatherAutofilledNotifier, bool>(
      CropWeatherAutofilledNotifier.new,
    );

final cropWeatherSourceLabelProvider =
    NotifierProvider<CropWeatherSourceLabelNotifier, String>(
      CropWeatherSourceLabelNotifier.new,
    );

class CropWeatherAutofilledNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void markAutofilled() => state = true;
}

class CropWeatherSourceLabelNotifier extends Notifier<String> {
  @override
  String build() => 'Weather data unavailable';

  void setLabel(String label) => state = label;
}

// Crop recommendation result notifier
final cropRecommendationProvider =
    NotifierProvider<
      CropRecommendationNotifier,
      CropRecommendationResponseModel?
    >(CropRecommendationNotifier.new);

class CropRecommendationNotifier
    extends Notifier<CropRecommendationResponseModel?> {
  @override
  CropRecommendationResponseModel? build() => null;

  void setRecommendation(CropRecommendationResponseModel result) =>
      state = result;

  void clear() => state = null;
}

// Loading state provider
final cropRecommendationLoadingProvider =
    NotifierProvider<CropLoadingNotifier, bool>(CropLoadingNotifier.new);

class CropLoadingNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setLoading(bool loading) => state = loading;
}
