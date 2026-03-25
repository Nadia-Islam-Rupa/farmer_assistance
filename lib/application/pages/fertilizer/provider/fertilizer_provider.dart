import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Form key provider
final fertilizerFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);

// Text editing controllers
final fertilizerCropControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final fertilizerSoilTypeControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final fertilizerNitrogenControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final fertilizerPhosphorusControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final fertilizerPotassiumControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final fertilizerMoistureControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final fertilizerTemperatureControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

// Weather auto-fill tracking
final fertilizerWeatherAutofilledProvider =
    NotifierProvider<FertilizerWeatherAutofilledNotifier, bool>(
  FertilizerWeatherAutofilledNotifier.new,
);

final fertilizerWeatherSourceLabelProvider =
    NotifierProvider<FertilizerWeatherSourceLabelNotifier, String>(
  FertilizerWeatherSourceLabelNotifier.new,
);

class FertilizerWeatherAutofilledNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void markAutofilled() => state = true;
}

class FertilizerWeatherSourceLabelNotifier extends Notifier<String> {
  @override
  String build() => 'Weather data unavailable';

  void setLabel(String label) => state = label;
}

// Fertilizer recommendation result notifier
final fertilizerRecommendationProvider =
    NotifierProvider<FertilizerRecommendationNotifier, FertilizerResult?>(
      FertilizerRecommendationNotifier.new,
    );

class FertilizerResult {
  final String recommendedFertilizer;
  final String npkRatio;
  final double nitrogenNeeded;
  final double phosphorusNeeded;
  final double potassiumNeeded;
  final List<String> tips;

  FertilizerResult({
    required this.recommendedFertilizer,
    required this.npkRatio,
    required this.nitrogenNeeded,
    required this.phosphorusNeeded,
    required this.potassiumNeeded,
    required this.tips,
  });
}

class FertilizerRecommendationNotifier extends Notifier<FertilizerResult?> {
  @override
  FertilizerResult? build() => null;

  void setRecommendation(FertilizerResult result) => state = result;

  void clear() => state = null;
}
