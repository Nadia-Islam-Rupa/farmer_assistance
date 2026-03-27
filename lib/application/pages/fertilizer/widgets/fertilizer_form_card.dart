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
    required this.rainfallController,
    required this.temperatureController,
    required this.phController,
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
  final TextEditingController rainfallController;
  final TextEditingController temperatureController;
  final TextEditingController phController;
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
            _DropdownField(
              value: selectedCrop,
              label: 'Crop Type',
              icon: Icons.eco_outlined,
              items: FertilizerConstants.crops,
              onChanged: (value) {
                if (value != null) {
                  cropController.text = value;
                  onCropChanged?.call(value);
                }
              },
            ),
            const SizedBox(height: 12),
            _DropdownField(
              value: selectedSoilType,
              label: 'Soil Type',
              icon: Icons.landscape_outlined,
              items: FertilizerConstants.soilTypes,
              onChanged: (value) {
                if (value != null) {
                  soilTypeController.text = value;
                  onSoilTypeChanged?.call(value);
                }
              },
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
            const SizedBox(height: 12),
            FertilizerInputField(
              controller: phController,
              label: 'Soil pH',
              icon: Icons.water_drop,
              isNumeric: true,
              validator: (value) => requiredNumber(value, 'pH'),
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
              controller: rainfallController,
              label: 'Rainfall',
              icon: Icons.cloudy_snowing,
              isNumeric: true,
              suffix: 'mm',
              validator: (value) => requiredNumber(value, 'Rainfall'),
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

  Future<void> _openPicker(BuildContext context) async {
    final searchController = TextEditingController();
    List<String> filteredItems = List<String>.from(items);

    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.45,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 48,
                        height: 5,
                        decoration: BoxDecoration(
                          color: const Color(0xffD3E6E2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                        child: Row(
                          children: [
                            Icon(icon, color: WaterPredictionTheme.deepTeal),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                label,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff174A44),
                                ),
                              ),
                            ),
                            Text(
                              '${filteredItems.length} options',
                              style: const TextStyle(
                                color: Color(0xff5D7D78),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: searchController,
                          onChanged: (query) {
                            setModalState(() {
                              final normalized = query.trim().toLowerCase();
                              filteredItems = items.where((item) {
                                return item.toLowerCase().contains(normalized);
                              }).toList();
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search option...',
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: const Color(0xffF7FBFA),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xffD5ECE7),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: WaterPredictionTheme.primaryTeal,
                                width: 1.4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: filteredItems.isEmpty
                            ? const Center(
                                child: Text(
                                  'No matching options',
                                  style: TextStyle(color: Color(0xff5D7D78)),
                                ),
                              )
                            : ListView.separated(
                                controller: scrollController,
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                                itemCount: filteredItems.length,
                                separatorBuilder: (_, _) =>
                                    const SizedBox(height: 2),
                                itemBuilder: (context, index) {
                                  final option = filteredItems[index];
                                  final isSelected = option == value;

                                  return Material(
                                    color: isSelected
                                        ? const Color(0xffE8F7F3)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      onTap: () =>
                                          Navigator.pop(context, option),
                                      title: Text(
                                        option,
                                        style: TextStyle(
                                          fontWeight: isSelected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                          color: const Color(0xff174A44),
                                        ),
                                      ),
                                      trailing: isSelected
                                          ? const Icon(
                                              Icons.check_circle,
                                              color: WaterPredictionTheme
                                                  .primaryTeal,
                                            )
                                          : const Icon(
                                              Icons.chevron_right,
                                              color: Color(0xff9DBBB5),
                                            ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );

    searchController.dispose();

    if (picked != null) {
      onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _openPicker(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: WaterPredictionTheme.deepTeal),
          suffixIcon: const Icon(
            Icons.expand_more_rounded,
            color: Color(0xff4C736D),
          ),
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
        child: Text(
          value ?? 'Tap to choose',
          style: TextStyle(
            color: value == null
                ? const Color(0xff7B9A95)
                : const Color(0xff174A44),
            fontWeight: value == null ? FontWeight.w500 : FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
