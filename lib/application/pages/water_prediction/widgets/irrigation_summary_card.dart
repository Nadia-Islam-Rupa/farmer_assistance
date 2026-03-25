import 'package:flutter/material.dart';

class IrrigationSummaryCard extends StatelessWidget {
  const IrrigationSummaryCard({
    super.key,
    required this.textTheme,
    required this.selectedCrop,
    required this.selectedSoil,
    required this.selectedStage,
  });

  final TextTheme textTheme;
  final String? selectedCrop;
  final String? selectedSoil;
  final String? selectedStage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffE8F7F3),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffBFE7DE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected Parameters',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xff174A44),
            ),
          ),
          const SizedBox(height: 10),
          _SummaryRow(label: 'Crop', value: selectedCrop),
          _SummaryRow(label: 'Soil Type', value: selectedSoil),
          _SummaryRow(label: 'Growth Stage', value: selectedStage),
          const SizedBox(height: 10),
          Text(
            'Backend model will be integrated to produce the irrigation decision using these inputs and current weather.',
            style: textTheme.bodySmall?.copyWith(
              color: const Color(0xff53746E),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff355B55),
            ),
          ),
          Text(
            value ?? 'Not selected',
            style: TextStyle(
              color: value != null
                  ? const Color(0xff174A44)
                  : const Color(0xff8AA7A2),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
