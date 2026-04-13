import 'package:farmer_assistance/application/pages/market_trends/constants/price_prediction_constants.dart';
import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PricePredictionFormCard extends StatelessWidget {
  final String? selectedDivision;
  final String? selectedDistrict;
  final String? selectedMarket;
  final String? selectedCategory;
  final String? selectedCommodity;
  final String? selectedUnit;
  final String? selectedPriceType;
  final String? selectedPriceFlag;
  final TextEditingController latitudeController;
  final TextEditingController longitudeController;
  final TextEditingController dateController;

  final void Function(String?) onDivisionChanged;
  final void Function(String?) onDistrictChanged;
  final void Function(String?) onMarketChanged;
  final void Function(String?) onCategoryChanged;
  final void Function(String?) onCommodityChanged;
  final void Function(String?) onUnitChanged;
  final void Function(String?) onPriceTypeChanged;
  final void Function(String?) onPriceFlagChanged;
  final VoidCallback onPickDate;

  const PricePredictionFormCard({
    super.key,
    required this.selectedDivision,
    required this.selectedDistrict,
    required this.selectedMarket,
    required this.selectedCategory,
    required this.selectedCommodity,
    required this.selectedUnit,
    required this.selectedPriceType,
    required this.selectedPriceFlag,
    required this.latitudeController,
    required this.longitudeController,
    required this.dateController,
    required this.onDivisionChanged,
    required this.onDistrictChanged,
    required this.onMarketChanged,
    required this.onCategoryChanged,
    required this.onCommodityChanged,
    required this.onUnitChanged,
    required this.onPriceTypeChanged,
    required this.onPriceFlagChanged,
    required this.onPickDate,
  });

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
            // ---- Location Section ----
            const Text(
              'Location',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WaterPredictionTheme.deepTeal,
              ),
            ),
            const SizedBox(height: 16),

            _DropdownField(
              value: selectedDivision,
              label: 'Division',
              icon: Icons.map_outlined,
              items: PricePredictionConstants.divisions,
              onChanged: onDivisionChanged,
            ),
            const SizedBox(height: 12),

            _DropdownField(
              value: selectedDistrict,
              label: selectedDivision == null
                  ? 'District (select division first)'
                  : 'District',
              icon: Icons.location_city_outlined,
              items: PricePredictionConstants.getDistricts(selectedDivision),
              onChanged: selectedDivision == null ? (_) {} : onDistrictChanged,
              enabled: selectedDivision != null,
            ),
            const SizedBox(height: 12),

            _DropdownField(
              value: selectedMarket,
              label: selectedDistrict == null
                  ? 'Market (select district first)'
                  : 'Market',
              icon: Icons.storefront_outlined,
              items: PricePredictionConstants.getMarkets(selectedDistrict),
              onChanged: selectedDistrict == null ? (_) {} : onMarketChanged,
              enabled: selectedDistrict != null,
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildReadOnlyField(
                    controller: latitudeController,
                    label: 'Latitude',
                    hint: 'Auto-filled',
                    icon: Icons.my_location_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildReadOnlyField(
                    controller: longitudeController,
                    label: 'Longitude',
                    hint: 'Auto-filled',
                    icon: Icons.my_location_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ---- Product Section ----
            const Text(
              'Product',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WaterPredictionTheme.deepTeal,
              ),
            ),
            const SizedBox(height: 16),

            _DropdownField(
              value: selectedCategory,
              label: 'Category',
              icon: Icons.category_outlined,
              items: PricePredictionConstants.categories,
              onChanged: onCategoryChanged,
            ),
            const SizedBox(height: 12),

            _DropdownField(
              value: selectedCommodity,
              label: selectedCategory == null
                  ? 'Commodity (select category first)'
                  : 'Commodity',
              icon: Icons.inventory_2_outlined,
              items: PricePredictionConstants.getCommodities(selectedCategory),
              onChanged: selectedCategory == null ? (_) {} : onCommodityChanged,
              enabled: selectedCategory != null,
            ),
            const SizedBox(height: 12),

            _DropdownField(
              value: selectedUnit,
              label: 'Unit',
              icon: Icons.straighten_outlined,
              items: PricePredictionConstants.units,
              onChanged: onUnitChanged,
            ),

            const SizedBox(height: 24),

            // ---- Price Metadata Section ----
            const Text(
              'Price Metadata',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WaterPredictionTheme.deepTeal,
              ),
            ),
            const SizedBox(height: 16),

            _DropdownField(
              value: selectedPriceType,
              label: 'Price Type',
              icon: Icons.sell_outlined,
              items: PricePredictionConstants.priceTypes,
              onChanged: onPriceTypeChanged,
            ),
            const SizedBox(height: 12),

            _DropdownField(
              value: selectedPriceFlag,
              label: 'Price Flag',
              icon: Icons.flag_outlined,
              items: PricePredictionConstants.priceFlags,
              onChanged: onPriceFlagChanged,
            ),

            const SizedBox(height: 24),

            // ---- Date Section ----
            const Text(
              'Date',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: WaterPredictionTheme.deepTeal,
              ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: dateController,
              readOnly: true,
              onTap: onPickDate,
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Please select a date' : null,
              decoration: InputDecoration(
                labelText: 'Prediction Date',
                hintText: 'YYYY-MM-DD',
                labelStyle:
                    TextStyle(color: Colors.grey.shade700, fontSize: 14),
                prefixIcon: const Icon(
                  Icons.event_outlined,
                  color: WaterPredictionTheme.primaryTeal,
                  size: 22,
                ),
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
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
                  borderSide:
                      BorderSide(color: Colors.grey.shade200, width: 1),
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
                  borderSide:
                      const BorderSide(color: Colors.redAccent, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.redAccent, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d{0,6}')),
      ],
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    );
  }
}

// ============================================================
// Custom dropdown that opens a bottom sheet with search
// (matches FertilizerFormCard's _DropdownField exactly)
// ============================================================
class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.value,
    required this.label,
    required this.icon,
    required this.items,
    required this.onChanged,
    this.enabled = true,
  });

  final String? value;
  final String label;
  final IconData icon;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final bool enabled;

  Future<void> _openPicker(BuildContext context) async {
    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _SearchPickerSheet(
        label: label,
        icon: icon,
        items: items,
        currentValue: value,
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
      onTap: enabled && items.isNotEmpty ? () => _openPicker(context) : null,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14),
          prefixIcon: Icon(icon, color: WaterPredictionTheme.deepTeal),
          suffixIcon: const Icon(
            Icons.expand_more_rounded,
            color: Color(0xff4C736D),
          ),
          filled: true,
          fillColor: enabled
              ? const Color(0xffF8FCFB)
              : const Color(0xffF2F2F2),
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
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Text(
          value ?? 'Tap to choose',
          style: TextStyle(
            color: value == null
                ? const Color(0xff7B9A95)
                : const Color(0xff174A44),
            fontWeight:
                value == null ? FontWeight.w500 : FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// Bottom sheet content as a proper StatefulWidget so the
// TextEditingController is disposed only after the dismiss
// animation fully completes — prevents the "used after dispose" crash.
// ============================================================
class _SearchPickerSheet extends StatefulWidget {
  const _SearchPickerSheet({
    required this.label,
    required this.icon,
    required this.items,
    required this.currentValue,
  });

  final String label;
  final IconData icon;
  final List<String> items;
  final String? currentValue;

  @override
  State<_SearchPickerSheet> createState() => _SearchPickerSheetState();
}

class _SearchPickerSheetState extends State<_SearchPickerSheet> {
  late final TextEditingController _searchController;
  late List<String> _filtered;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filtered = List<String>.from(widget.items);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    final normalized = query.trim().toLowerCase();
    setState(() {
      _filtered = widget.items
          .where((item) => item.toLowerCase().contains(normalized))
          .toList();
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
                    Icon(widget.icon, color: WaterPredictionTheme.deepTeal),
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
                      '${_filtered.length} options',
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
                  onChanged: _onSearch,
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
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _filtered.isEmpty
                    ? const Center(
                        child: Text(
                          'No matching options',
                          style: TextStyle(color: Color(0xff5D7D78)),
                        ),
                      )
                    : ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                        itemCount: _filtered.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: 2),
                        itemBuilder: (context, index) {
                          final option = _filtered[index];
                          final isSelected = option == widget.currentValue;

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
                                      color: WaterPredictionTheme.primaryTeal,
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
