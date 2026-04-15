import 'package:farmer_assistance/application/core/theme/app_theme.dart';
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

  Future<void> _openPicker(BuildContext context) async {
    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _SearchablePickerSheet(
        label: label,
        icon: icon,
        items: items,
        selectedValue: value,
      ),
    );

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
          prefixIcon: Icon(icon, color: AppTheme.deepTeal),
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
              color: AppTheme.primaryTeal,
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

class _SearchablePickerSheet extends StatefulWidget {
  const _SearchablePickerSheet({
    required this.label,
    required this.icon,
    required this.items,
    required this.selectedValue,
  });

  final String label;
  final IconData icon;
  final List<String> items;
  final String? selectedValue;

  @override
  State<_SearchablePickerSheet> createState() => _SearchablePickerSheetState();
}

class _SearchablePickerSheetState extends State<_SearchablePickerSheet> {
  late final TextEditingController _searchController;
  late List<String> _filteredItems;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredItems = List<String>.from(widget.items);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      final normalized = query.trim().toLowerCase();
      _filteredItems = widget.items.where((item) {
        return item.toLowerCase().contains(normalized);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.45,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                    Icon(widget.icon, color: AppTheme.deepTeal),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.label,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff174A44),
                        ),
                      ),
                    ),
                    Text(
                      '${_filteredItems.length} options',
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
                  controller: _searchController,
                  onChanged: _onSearchChanged,
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
                        color: AppTheme.primaryTeal,
                        width: 1.4,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _filteredItems.isEmpty
                    ? const Center(
                        child: Text(
                          'No matching options',
                          style: TextStyle(color: Color(0xff5D7D78)),
                        ),
                      )
                    : ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                        itemCount: _filteredItems.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: 2),
                        itemBuilder: (context, index) {
                          final option = _filteredItems[index];
                          final isSelected = option == widget.selectedValue;

                          return Material(
                            color: isSelected
                                ? const Color(0xffE8F7F3)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onTap: () => Navigator.pop(context, option),
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
                                      color: AppTheme.primaryTeal,
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
  }
}
