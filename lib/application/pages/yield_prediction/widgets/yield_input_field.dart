import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class YieldInputField extends StatelessWidget {
  const YieldInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.validator,
    this.isNumeric = false,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? Function(String?) validator;
  final bool isNumeric;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: isNumeric
          ? const TextInputType.numberWithOptions(decimal: true)
          : null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: WaterPredictionTheme.deepTeal),
        filled: true,
        fillColor: const Color(0xffF5FCFA),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xffC6E9E3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xffC6E9E3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: WaterPredictionTheme.primaryTeal,
            width: 1.3,
          ),
        ),
      ),
    );
  }
}
