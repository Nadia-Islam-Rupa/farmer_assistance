import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:farmer_assistance/application/pages/water_prediction/widgets/irrigation_input_card.dart';
import 'package:farmer_assistance/application/pages/water_prediction/widgets/irrigation_page_header.dart';
import 'package:farmer_assistance/application/pages/water_prediction/widgets/irrigation_result_card.dart';
import 'package:farmer_assistance/application/pages/water_prediction/widgets/irrigation_weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di/di.dart';
import '../../../domain/models/smart_irrigation_request_model.dart';
import '../../../domain/models/smart_irrigation_response_model.dart';
import 'bloc/water_prediction_bloc.dart';

class IrrigationPage extends StatelessWidget {
  const IrrigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WaterPredictionBloc>(),
      child: const Irrigation(),
    );
  }
}

class Irrigation extends ConsumerStatefulWidget {
  const Irrigation({super.key});

  @override
  ConsumerState<Irrigation> createState() => _IrrigationState();
}

class _IrrigationState extends ConsumerState<Irrigation> {
  String? selectedCrop;
  String? selectedSoil;
  String? selectedStage;
  String temperature = '';
  String humidity = '';
  String rain = '';
  String moisture = '';
  SmartIrrigationResponseModel? predictionResult;

  final crops = ['Wheat', 'Chilli', 'Potato', 'Carrot', 'Tomato'];

  final soils = [
    'Clay Soil',
    'Sandy Soil',
    'Red Soil',
    'Loam Soil',
    'Black Soil',
    'Alluvial Soil',
    'Chalky Soil',
  ];

  final stages = [
    'Flowering',
    'Seedling Stage',
    'Vegetative Growth / Root or Tuber Development',
    'Germination',
    'Pollination',
    'Fruit/Grain/Bulb Formation',
    'Maturation',
    'Harvest',
  ];

  void showInputSummary() {
    if (selectedCrop == null || selectedSoil == null || selectedStage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    setState(() {
      predictionResult = null;
    });

    context.read<WaterPredictionBloc>().add(
      WaterPredictionEvent.started(
        data: SmartIrrigationRequestModel(
          cropId: selectedCrop,
          soilType: selectedSoil,
          seedlingStage: selectedStage,
          moi: double.tryParse(moisture),
          temp: double.tryParse(temperature),
          humidity: double.tryParse(humidity),
        ),
      ),
    );

    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: const Text('Irrigation Parameters'),
    //     content: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text('Crop: $selectedCrop'),
    //         Text('Soil Type: $selectedSoil'),
    //         Text('Growth Stage: $selectedStage'),
    //       ],
    //     ),
    //     actions: [
    //       TextButton(
    //         onPressed: () => Navigator.pop(context),
    //         child: const Text('Close'),
    //       ),
    //     ],
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final weatherAsync = ref.watch(weatherProvider);
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<WaterPredictionBloc, WaterPredictionState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (data) {
            setState(() {
              predictionResult = data;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Prediction completed!'),
                backgroundColor: WaterPredictionTheme.primaryTeal,
                duration: Duration(seconds: 2),
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red.shade700,
                ),
              );
          },
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF1FAF8),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: WaterPredictionTheme.primaryTeal,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Smart Irrigation',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                WaterPredictionTheme.pageTopTint,
                WaterPredictionTheme.pageBottomTint,
              ],
              stops: [0, 0.48],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IrrigationPageHeader(textTheme: textTheme),
                  const SizedBox(height: 16),
                  weatherAsync.when(
                    data: (weather) {
                      final current =
                          weather['current'] as Map<String, dynamic>?;
                      temperature =
                          current?['temperature_2m']?.toString() ?? '';
                      humidity =
                          current?['relative_humidity_2m']?.toString() ?? '';
                      rain = current?['rain']?.toString() ?? '';
                      moisture =
                          current?['soil_moisture_0_to_1cm']?.toString() ?? '';

                      return IrrigationWeatherCard(
                        textTheme: textTheme,
                        temperature: temperature,
                        humidity: humidity,
                        rain: rain,
                      );
                    },
                    loading: () => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: WaterPredictionTheme.primaryTeal,
                        ),
                      ),
                    ),
                    error: (e, _) => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFF3F2),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xffF9C6C2)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.error_outline, color: Color(0xffC62828)),
                          SizedBox(width: 10),
                          Expanded(child: Text('Unable to load weather data')),
                        ],
                      ),
                    ),
                  ),
                  // IrrigationWeatherCard(
                  //   weatherAsync: weatherAsync,
                  //   textTheme: textTheme,
                  // ),
                  const SizedBox(height: 16),
                  IrrigationInputCard(
                    textTheme: textTheme,
                    selectedCrop: selectedCrop,
                    selectedSoil: selectedSoil,
                    selectedStage: selectedStage,
                    crops: crops,
                    soils: soils,
                    stages: stages,
                    onCropChanged: (value) =>
                        setState(() => selectedCrop = value),
                    onSoilChanged: (value) =>
                        setState(() => selectedSoil = value),
                    onStageChanged: (value) =>
                        setState(() => selectedStage = value),
                  ),
                  const SizedBox(height: 16),
                  _buildActionButton(),
                  if (predictionResult != null) ...[
                    const SizedBox(height: 16),
                    IrrigationResultCard(
                      result: predictionResult!,
                      textTheme: textTheme,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: showInputSummary,
        icon: const Icon(Icons.check_circle_outline),
        label: const Text(
          'Analyze Irrigation Needs',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 52),
          elevation: 0,
          backgroundColor: WaterPredictionTheme.primaryTeal,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
