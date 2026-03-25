import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class IrrigationInputCard extends StatelessWidget {
  const IrrigationInputCard({
    super.key,
    required this.textTheme,
    required this.selectedCrop,
    required this.selectedSoil,
    required this.selectedStage,
    required this.crops,
    required this.soils,
    required this.stages,
    required this.onCropChanged,
    required this.onSoilChanged,
    required this.onStageChanged,
  });

  final TextTheme textTheme;
  final String? selectedCrop;
  final String? selectedSoil;
  final String? selectedStage;
  final List<String> crops;
  final List<String> soils;
  final List<String> stages;
  final ValueChanged<String?> onCropChanged;
  final ValueChanged<String?> onSoilChanged;
  final ValueChanged<String?> onStageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1426A69A),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Input Parameters',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xff174A44),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'These values will be sent to your irrigation model.',
            style: textTheme.bodySmall?.copyWith(
              color: const Color(0xff5D7D78),
            ),
          ),
          const SizedBox(height: 14),
          _DropdownField(
            value: selectedCrop,
            label: 'Select Crop',
            icon: Icons.eco_outlined,
            items: crops,
            onChanged: onCropChanged,
          ),
          const SizedBox(height: 12),
          _DropdownField(
            value: selectedSoil,
            label: 'Select Soil Type',
            icon: Icons.landscape_outlined,
            items: soils,
            onChanged: onSoilChanged,
          ),
          const SizedBox(height: 12),
          _DropdownField(
            value: selectedStage,
            label: 'Growth Stage',
            icon: Icons.spa_outlined,
            items: stages,
            onChanged: onStageChanged,
          ),
        ],
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.value,
    required this.label,
    required this.icon,
    required this.items,
    required this.onChanged,
  });

  final String? value;
  final String label;
  final IconData icon;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      borderRadius: BorderRadius.circular(12),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: WaterPredictionTheme.deepTeal),
        filled: true,
        fillColor: const Color(0xffF8FCFB),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffD5ECE7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: WaterPredictionTheme.primaryTeal,
            width: 1.4,
          ),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
