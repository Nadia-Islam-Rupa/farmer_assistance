import 'package:farmer_assistance/application/pages/water_prediction/water_prediction_theme.dart';
import 'package:flutter/material.dart';

class YieldDropdownField extends StatelessWidget {
  const YieldDropdownField({
    super.key,
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
