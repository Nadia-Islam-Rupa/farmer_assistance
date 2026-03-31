import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final yieldProvider = NotifierProvider<YieldNotifier, double?>(
  YieldNotifier.new,
);

final yieldFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);

final yieldSelectedCropProvider =
    NotifierProvider.autoDispose<YieldSelectedCropNotifier, String?>(
      YieldSelectedCropNotifier.new,
    );

final yieldSelectedAreaProvider =
    NotifierProvider.autoDispose<YieldSelectedAreaNotifier, String?>(
      YieldSelectedAreaNotifier.new,
    );

final yieldRainfallControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final yieldTemperatureControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final yieldPesticideControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
      final controller = TextEditingController();
      ref.onDispose(controller.dispose);
      return controller;
    });

final yieldWeatherAutofilledProvider =
    NotifierProvider<YieldWeatherAutofilledNotifier, bool>(
      YieldWeatherAutofilledNotifier.new,
    );

final yieldWeatherSourceLabelProvider =
    NotifierProvider<YieldWeatherSourceLabelNotifier, String>(
      YieldWeatherSourceLabelNotifier.new,
    );

class YieldWeatherAutofilledNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void markAutofilled() => state = true;
}

class YieldWeatherSourceLabelNotifier extends Notifier<String> {
  @override
  String build() => 'Weather data unavailable';

  void setLabel(String label) => state = label;
}

class YieldSelectedCropNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setCrop(String? value) => state = value;
}

class YieldSelectedAreaNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setArea(String? value) => state = value;
}

class YieldNotifier extends Notifier<double?> {
  @override
  double? build() => null;

  void setYield(double value) => state = value;
}
