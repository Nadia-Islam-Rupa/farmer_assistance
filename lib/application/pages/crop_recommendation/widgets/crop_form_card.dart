import 'package:farmer_assistance/application/core/utils/validation_utils.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/constants/crop_constants.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/widgets/crop_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CropFormCard extends StatelessWidget {
  final TextEditingController nitrogenController;
  final TextEditingController phosphorusController;
  final TextEditingController potassiumController;
  final TextEditingController phController;
  final TextEditingController temperatureController;
  final TextEditingController humidityController;
  final TextEditingController rainfallController;
  final String? selectedSoilType;
  final void Function(String?) onSoilTypeChanged;

  const CropFormCard({
    super.key,
    required this.nitrogenController,
    required this.phosphorusController,
    required this.potassiumController,
    required this.phController,
    required this.temperatureController,
    required this.humidityController,
    required this.rainfallController,
    required this.selectedSoilType,
    required this.onSoilTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Soil Data Section
          const Row(
            children: [
              Icon(Icons.terrain, color: Color(0xff00796B), size: 24),
              SizedBox(width: 8),
              Text(
                'Soil Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff00796B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CropDropdownField(
            value: selectedSoilType,
            label: 'Soil Type',
            hint: 'Select soil type',
            icon: Icons.layers,
            items: CropConstants.soilTypes,
            onChanged: onSoilTypeChanged,
            validator: (value) =>
                ValidationUtils.requiredText(value, 'Soil Type'),
          ),
          const SizedBox(height: 12),
          CropInputField(
            controller: nitrogenController,
            label: 'Nitrogen (N)',
            hint: 'Enter nitrogen level (0-140 kg/ha)',
            icon: Icons.science,
            validator: (value) => ValidationUtils.validateRange(
              value,
              CropConstants.minNitrogen,
              CropConstants.maxNitrogen,
              'Nitrogen',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
          ),
          const SizedBox(height: 12),
          CropInputField(
            controller: phosphorusController,
            label: 'Phosphorus (P)',
            hint: 'Enter phosphorus level (5-145 kg/ha)',
            icon: Icons.science,
            validator: (value) => ValidationUtils.validateRange(
              value,
              CropConstants.minPhosphorus,
              CropConstants.maxPhosphorus,
              'Phosphorus',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
          ),
          const SizedBox(height: 12),
          CropInputField(
            controller: potassiumController,
            label: 'Potassium (K)',
            hint: 'Enter potassium level (5-205 kg/ha)',
            icon: Icons.science,
            validator: (value) => ValidationUtils.validateRange(
              value,
              CropConstants.minPotassium,
              CropConstants.maxPotassium,
              'Potassium',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
          ),
          const SizedBox(height: 12),
          CropInputField(
            controller: phController,
            label: 'Soil pH',
            hint: 'Enter pH level (3.5-10)',
            icon: Icons.water_drop,
            validator: (value) => ValidationUtils.validateRange(
              value,
              CropConstants.minPH,
              CropConstants.maxPH,
              'pH',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
          ),
          const SizedBox(height: 24),

          // Weather Data Section
          const Row(
            children: [
              Icon(Icons.wb_sunny, color: Color(0xff00796B), size: 24),
              SizedBox(width: 8),
              Text(
                'Weather Conditions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff00796B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CropInputField(
            controller: temperatureController,
            label: 'Temperature',
            hint: 'Enter temperature in °C',
            icon: Icons.thermostat,
            validator: (value) =>
                ValidationUtils.requiredNumber(value, 'Temperature'),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d{0,2}')),
            ],
          ),
          const SizedBox(height: 12),
          CropInputField(
            controller: humidityController,
            label: 'Humidity',
            hint: 'Enter humidity percentage',
            icon: Icons.water,
            validator: (value) =>
                ValidationUtils.validateRange(value, 0, 100, 'Humidity'),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
          ),
          const SizedBox(height: 12),
          CropInputField(
            controller: rainfallController,
            label: 'Rainfall',
            hint: 'Enter average rainfall (20-300 mm)',
            icon: Icons.cloudy_snowing,
            validator: (value) => ValidationUtils.validateRange(
              value,
              CropConstants.minRainfall,
              CropConstants.maxRainfall,
              'Rainfall',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
          ),
        ],
      ),
    );
  }
}
