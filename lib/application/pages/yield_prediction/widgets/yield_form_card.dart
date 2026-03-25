import 'package:farmer_assistance/application/pages/yield_prediction/widgets/yield_input_field.dart';
import 'package:flutter/material.dart';

class YieldFormCard extends StatelessWidget {
  const YieldFormCard({
    super.key,
    required this.cropController,
    required this.areaController,
    required this.rainfallController,
    required this.temperatureController,
    required this.pesticideController,
    required this.requiredText,
    required this.requiredNumber,
  });

  final TextEditingController cropController;
  final TextEditingController areaController;
  final TextEditingController rainfallController;
  final TextEditingController temperatureController;
  final TextEditingController pesticideController;
  final String? Function(String?, String) requiredText;
  final String? Function(String?, String) requiredNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            YieldInputField(
              controller: cropController,
              label: 'Crop Name',
              icon: Icons.grass_outlined,
              validator: (value) => requiredText(value, 'Crop'),
            ),
            const SizedBox(height: 12),
            YieldInputField(
              controller: areaController,
              label: 'Area (hectare)',
              icon: Icons.square_foot,
              isNumeric: true,
              validator: (value) => requiredNumber(value, 'Area'),
            ),
            const SizedBox(height: 12),
            YieldInputField(
              controller: rainfallController,
              label: 'Rainfall (mm today)',
              icon: Icons.water_drop_outlined,
              isNumeric: true,
              validator: (value) => requiredNumber(value, 'Rainfall'),
            ),
            const SizedBox(height: 12),
            YieldInputField(
              controller: temperatureController,
              label: 'Temperature (C)',
              icon: Icons.thermostat_outlined,
              isNumeric: true,
              validator: (value) => requiredNumber(value, 'Temperature'),
            ),
            const SizedBox(height: 12),
            YieldInputField(
              controller: pesticideController,
              label: 'Pesticides (tonnes)',
              icon: Icons.science_outlined,
              isNumeric: true,
              validator: (value) => requiredNumber(value, 'Pesticides'),
            ),
          ],
        ),
      ),
    );
  }
}
