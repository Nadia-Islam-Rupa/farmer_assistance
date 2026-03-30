import 'package:farmer_assistance/application/pages/yield_prediction/widgets/yield_input_field.dart';
import 'package:farmer_assistance/application/pages/yield_prediction/widgets/yield_dropdown_field.dart';
import 'package:flutter/material.dart';

class YieldFormCard extends StatelessWidget {
  const YieldFormCard({
    super.key,
    required this.selectedCrop,
    required this.selectedArea,
    required this.rainfallController,
    required this.temperatureController,
    required this.pesticideController,
    required this.crops,
    required this.areas,
    required this.onCropChanged,
    required this.onAreaChanged,
    required this.requiredNumber,
  });

  final String? selectedCrop;
  final String? selectedArea;
  final TextEditingController rainfallController;
  final TextEditingController temperatureController;
  final TextEditingController pesticideController;
  final List<String> crops;
  final List<String> areas;
  final ValueChanged<String?> onCropChanged;
  final ValueChanged<String?> onAreaChanged;
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
            YieldDropdownField(
              value: selectedCrop,
              label: 'Select Crop',
              icon: Icons.eco_outlined,
              items: crops,
              onChanged: onCropChanged,
            ),
            const SizedBox(height: 12),
            YieldDropdownField(
              value: selectedArea,
              label: 'Select Location',
              icon: Icons.location_on_outlined,
              items: areas,
              onChanged: onAreaChanged,
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
