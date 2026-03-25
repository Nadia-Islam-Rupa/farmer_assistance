import 'package:farmer_assistance/application/pages/forcast/provider/weather_service.dart';
import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:farmer_assistance/application/pages/water_prediction/widgets/irrigation_input_card.dart';
import 'package:farmer_assistance/application/pages/water_prediction/widgets/irrigation_page_header.dart';
import 'package:farmer_assistance/application/pages/water_prediction/widgets/irrigation_summary_card.dart';
import 'package:farmer_assistance/application/pages/water_prediction/widgets/irrigation_weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IrrigationPage extends ConsumerStatefulWidget {
  const IrrigationPage({super.key});

  @override
  ConsumerState<IrrigationPage> createState() => _IrrigationPageState();
}

class _IrrigationPageState extends ConsumerState<IrrigationPage> {
  String? selectedCrop;
  String? selectedSoil;
  String? selectedStage;

  final crops = ['Wheat', 'Rice', 'Maize', 'Cotton', 'Sugarcane'];
  final soils = ['Black Soil', 'Sandy', 'Clay', 'Loam'];
  final stages = ['Germination', 'Vegetative', 'Flowering', 'Fruiting'];

  void showInputSummary() {
    if (selectedCrop == null || selectedSoil == null || selectedStage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Irrigation Parameters'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Crop: $selectedCrop'),
            Text('Soil Type: $selectedSoil'),
            Text('Growth Stage: $selectedStage'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherAsync = ref.watch(weatherProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
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
                IrrigationWeatherCard(
                  weatherAsync: weatherAsync,
                  textTheme: textTheme,
                ),
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
                if (selectedCrop != null ||
                    selectedSoil != null ||
                    selectedStage != null) ...[
                  const SizedBox(height: 16),
                  IrrigationSummaryCard(
                    textTheme: textTheme,
                    selectedCrop: selectedCrop,
                    selectedSoil: selectedSoil,
                    selectedStage: selectedStage,
                  ),
                ],
              ],
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
