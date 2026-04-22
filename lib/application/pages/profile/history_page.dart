import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/profile/bloc/history_cubit.dart';
import 'package:farmer_assistance/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryCubit(getIt<SupabaseClient>())..fetchAll(),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatefulWidget {
  const _HistoryView();

  @override
  State<_HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<_HistoryView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _tabs = [
    _TabInfo(Icons.eco_outlined, 'Fertilizer'),
    _TabInfo(Icons.water_drop_outlined, 'Irrigation'),
    _TabInfo(Icons.bar_chart_outlined, 'Yield'),
    _TabInfo(Icons.grass_outlined, 'Crop Rec.'),
    _TabInfo(Icons.attach_money_outlined, 'Price'),
    _TabInfo(Icons.search_outlined, 'Disease'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Activity History',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelStyle:
              const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          tabs: _tabs
              .map((t) => Tab(icon: Icon(t.icon, size: 18), text: t.label))
              .toList(),
        ),
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryTeal),
            );
          }
          if (state is HistoryError) {
            return _ErrorView(
              message: state.message,
              onRetry: () => context.read<HistoryCubit>().fetchAll(),
            );
          }
          if (state is HistoryLoaded) {
            return RefreshIndicator(
              color: AppTheme.primaryTeal,
              onRefresh: () => context.read<HistoryCubit>().fetchAll(),
              child: TabBarView(
                controller: _tabController,
                children: [
                  _FertilizerTab(items: state.fertilizerTips),
                  _IrrigationTab(items: state.smartIrrigation),
                  _YieldTab(items: state.yieldEstimations),
                  _CropRecTab(items: state.cropRecommendations),
                  _PriceTab(items: state.pricePredictions),
                  _DiseaseTab(items: state.cropDiseaseResults),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

// ─── Tab views ───────────────────────────────────────────────────────────────

class _FertilizerTab extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const _FertilizerTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return _HistoryList(
      items: items,
      emptyIcon: Icons.eco_outlined,
      emptyLabel: 'No fertilizer history yet',
      cardBuilder: (item) => _HistoryCard(
        icon: Icons.eco_outlined,
        title: 'Fertilizer: ${item['fertilizer'] ?? '-'}',
        createdAt: item['created_at'],
        details: {
          'Crop': item['crop'],
          'Soil Color': item['soil_color'],
          'Nitrogen': item['nitrogen'],
          'Phosphorus': item['phosphorus'],
          'Potassium': item['potassium'],
          'pH': item['ph'],
          'Temperature': item['temperature'],
          'Rainfall': item['rainfall'],
        },
      ),
    );
  }
}

class _IrrigationTab extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const _IrrigationTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return _HistoryList(
      items: items,
      emptyIcon: Icons.water_drop_outlined,
      emptyLabel: 'No irrigation history yet',
      cardBuilder: (item) {
        final needed = item['irrigation_needed'];
        final label = needed == true
            ? 'Irrigation Needed'
            : needed == false
                ? 'No Irrigation Needed'
                : '-';
        return _HistoryCard(
          icon: Icons.water_drop_outlined,
          title: label,
          subtitle: item['recommendation'],
          createdAt: item['created_at'],
          details: {
            'Crop': item['crop_id'],
            'Soil Type': item['soil_type'],
            'Seedling Stage': item['seedling_stage'],
            'Moisture': item['moisture'],
            'Temperature': item['temperature'],
            'Humidity': item['humidity'],
          },
        );
      },
    );
  }
}

class _YieldTab extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const _YieldTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return _HistoryList(
      items: items,
      emptyIcon: Icons.bar_chart_outlined,
      emptyLabel: 'No yield estimation history yet',
      cardBuilder: (item) {
        final yieldVal = item['predicted_yield'];
        final unit = item['yield_unit'] ?? '';
        final title = yieldVal != null
            ? 'Yield: ${(yieldVal as num).toStringAsFixed(2)} $unit'
            : 'Yield: -';
        return _HistoryCard(
          icon: Icons.bar_chart_outlined,
          title: title,
          createdAt: item['created_at'],
          details: {
            'Crop': item['item'],
            'Area': item['area'],
            'Rainfall': item['rainfall'],
            'Temperature': item['temperature'],
            'Pesticides': item['pesticides'],
          },
        );
      },
    );
  }
}

class _CropRecTab extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const _CropRecTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return _HistoryList(
      items: items,
      emptyIcon: Icons.grass_outlined,
      emptyLabel: 'No crop recommendation history yet',
      cardBuilder: (item) => _HistoryCard(
        icon: Icons.grass_outlined,
        title: 'Crop: ${item['crop'] ?? '-'}',
        createdAt: item['created_at'],
        details: {
          'Nitrogen': item['nitrogen'],
          'Phosphorus': item['phosphorus'],
          'Potassium': item['potassium'],
          'pH': item['ph'],
          'Temperature': item['temperature'],
          'Humidity': item['humidity'],
          'Rainfall': item['rainfall'],
        },
      ),
    );
  }
}

class _PriceTab extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const _PriceTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return _HistoryList(
      items: items,
      emptyIcon: Icons.attach_money_outlined,
      emptyLabel: 'No price prediction history yet',
      cardBuilder: (item) {
        final price = item['predicted_price'];
        final currency = item['currency'] ?? '';
        final title = price != null
            ? 'Price: $currency ${(price as num).toStringAsFixed(2)}'
            : 'Price: -';
        return _HistoryCard(
          icon: Icons.attach_money_outlined,
          title: title,
          createdAt: item['created_at'],
          details: {
            'Commodity': item['commodity'],
            'Market': item['market'],
            'Region': item['admin1'],
            'District': item['admin2'],
            'Unit': item['unit'],
            'Price Type': item['pricetype'],
            'Date': item['date'],
          },
        );
      },
    );
  }
}

class _DiseaseTab extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const _DiseaseTab({required this.items});

  @override
  Widget build(BuildContext context) {
    return _HistoryList(
      items: items,
      emptyIcon: Icons.search_outlined,
      emptyLabel: 'No disease detection history yet',
      cardBuilder: (item) => _DiseaseCard(item: item),
    );
  }
}

class _DiseaseCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const _DiseaseCard({required this.item});

  String _formatDate(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = DateTime.parse(raw.toString()).toLocal();
      return DateFormat('MMM d, yyyy · HH:mm').format(dt);
    } catch (_) {
      return raw.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final heatmapUrl = item['heatmap_path'] as String?;

    return Container(
      decoration: AppTheme.cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryTeal.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                  ),
                  child: const Icon(
                    Icons.search_outlined,
                    color: AppTheme.primaryTeal,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Disease: ${item['label'] ?? '-'}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        _formatDate(item['created_at']),
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppTheme.textHint,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (heatmapUrl != null && heatmapUrl.isNotEmpty) ...[
            const Divider(height: 1),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppTheme.radiusLarge),
                bottomRight: Radius.circular(AppTheme.radiusLarge),
              ),
              child: Image.network(
                heatmapUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    height: 200,
                    color: AppTheme.lightGrey,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primaryTeal,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 100,
                  color: AppTheme.lightGrey,
                  child: const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: AppTheme.textHint,
                      size: 36,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Shared widgets ───────────────────────────────────────────────────────────

class _HistoryList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final IconData emptyIcon;
  final String emptyLabel;
  final Widget Function(Map<String, dynamic>) cardBuilder;

  const _HistoryList({
    required this.items,
    required this.emptyIcon,
    required this.emptyLabel,
    required this.cardBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              emptyIcon,
              size: 56,
              color: AppTheme.primaryTeal.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 12),
            Text(
              emptyLabel,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, i) => cardBuilder(items[i]),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final dynamic createdAt;
  final Map<String, dynamic> details;

  const _HistoryCard({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.createdAt,
    required this.details,
  });

  String _formatDate(dynamic raw) {
    if (raw == null) return '';
    try {
      final dt = DateTime.parse(raw.toString()).toLocal();
      return DateFormat('MMM d, yyyy · HH:mm').format(dt);
    } catch (_) {
      return raw.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.cardDecoration(),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryTeal.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            ),
            child: Icon(icon, color: AppTheme.primaryTeal, size: 22),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (subtitle != null && subtitle!.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 3),
              Text(
                _formatDate(createdAt),
                style: const TextStyle(
                  fontSize: 11,
                  color: AppTheme.textHint,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          children: [
            const Divider(height: 1),
            const SizedBox(height: 8),
            ...details.entries
                .where((e) => e.value != null)
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.key,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            e.value.toString(),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 52, color: AppTheme.errorRed),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabInfo {
  final IconData icon;
  final String label;
  const _TabInfo(this.icon, this.label);
}
