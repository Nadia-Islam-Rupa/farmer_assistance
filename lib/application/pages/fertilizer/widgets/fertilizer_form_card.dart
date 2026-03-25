import 'package:farmer_assistance/application/pages/fertilizer/constants/fertilizer_constants.dart';
import 'package:farmer_assistance/application/pages/fertilizer/widgets/fertilizer_input_field.dart';
import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class FertilizerFormCard extends StatelessWidget {
  const FertilizerFormCard({
    super.key,
    required this.cropController,
    required this.soilTypeController,
    required this.nitrogenController,
    required this.phosphorusController,
    required this.potassiumController,
    required this.moistureController,
    required this.temperatureController,
    required this.requiredText,
    required this.requiredNumber,
    this.onSoilTypeChanged,
    this.onCropChanged,
    this.selectedSoilType,
    this.selectedCrop,
  });

  final TextEditingController cropController;
  final TextEditingController soilTypeController;
  final TextEditingController nitrogenController;
  final TextEditingController phosphorusController;
  final TextEditingController potassiumController;
  final TextEditingController moistureController;
  final TextEditingController temperatureController;
  final String? Function(String?, String) requiredText;
  final String? Function(String?, String) requiredNumber;
  final void Function(String?)? onSoilTypeChanged;
  final void Function(String?)? onCropChanged;
  final String? selectedSoilType;
  final String? selectedCrop;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Crop & Soil Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WaterPredictionTheme.deepTeal,
              ),
            ),
            const SizedBox(height: 16),
            _buildDropdownField(
              context: context,
              label: 'Crop Type',
              icon: Icons.grass_outlined,
              value: selectedCrop,
              items: FertilizerConstants.crops,
              onChanged: (value) {
                if (value != null) {
                  cropController.text = value;
                  onCropChanged?.call(value);
                }
              },
              validator: (value) => requiredText(value, 'Crop type'),
            ),
            const SizedBox(height: 12),
            _buildDropdownField(
              context: context,
              label: 'Soil Type',
              icon: Icons.terrain,
              value: selectedSoilType,
              items: FertilizerConstants.soilTypes,
              onChanged: (value) {
                if (value != null) {
                  soilTypeController.text = value;
                  onSoilTypeChanged?.call(value);
                }
              },
              validator: (value) => requiredText(value, 'Soil type'),
            ),
            const SizedBox(height: 24),
            Text(
              'Current NPK Values',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WaterPredictionTheme.deepTeal,
              ),
            ),
            const SizedBox(height: 16),
            FertilizerInputField(
              controller: nitrogenController,
              label: 'Nitrogen (N)',
              icon: Icons.blur_circular,
              isNumeric: true,
              suffix: 'kg/ha',
              validator: (value) => requiredNumber(value, 'Nitrogen'),
            ),
            const SizedBox(height: 12),
            FertilizerInputField(
              controller: phosphorusController,
              label: 'Phosphorus (P)',
              icon: Icons.bubble_chart,
              isNumeric: true,
              suffix: 'kg/ha',
              validator: (value) => requiredNumber(value, 'Phosphorus'),
            ),
            const SizedBox(height: 12),
            FertilizerInputField(
              controller: potassiumController,
              label: 'Potassium (K)',
              icon: Icons.scatter_plot,
              isNumeric: true,
              suffix: 'kg/ha',
              validator: (value) => requiredNumber(value, 'Potassium'),
            ),
            const SizedBox(height: 24),
            Text(
              'Environmental Conditions',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WaterPredictionTheme.deepTeal,
              ),
            ),
            const SizedBox(height: 16),
            FertilizerInputField(
              controller: moistureController,
              label: 'Soil Moisture',
              icon: Icons.water_drop_outlined,
              isNumeric: true,
              suffix: '%',
              validator: (value) => requiredNumber(value, 'Soil moisture'),
            ),
            const SizedBox(height: 12),
            FertilizerInputField(
              controller: temperatureController,
              label: 'Temperature',
              icon: Icons.thermostat_outlined,
              isNumeric: true,
              suffix: '°C',
              validator: (value) => requiredNumber(value, 'Temperature'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required BuildContext context,
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14),
        prefixIcon: Icon(
          icon,
          color: WaterPredictionTheme.primaryTeal,
          size: 22,
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: WaterPredictionTheme.primaryTeal,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}
