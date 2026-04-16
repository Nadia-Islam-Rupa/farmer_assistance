import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/market_trends/constants/price_prediction_constants.dart';
import 'package:farmer_assistance/domain/models/price_prediction_response_model.dart';
import 'package:flutter/material.dart';

class PricePredictionResultCard extends StatelessWidget {
  final PricePredictionResponseModel result;

  const PricePredictionResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final price = result.predictedPrice;
    final currency = result.currency ?? 'BDT';
    final commodity = result.commodity ?? '';
    final unit = result.unit ?? '';
    final market = result.market ?? '';
    final pricetype = result.pricetype ?? '';
    final confidence = result.confidence;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryTeal.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  PricePredictionConstants.getCommodityEmoji(commodity),
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Predicted Price',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price != null
                          ? '$currency ${price.toStringAsFixed(2)}'
                          : 'N/A',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (unit.isNotEmpty)
                      Text(
                        'per $unit',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: Colors.white24, thickness: 1),
          const SizedBox(height: 12),

          // Details grid
          Row(
            children: [
              Expanded(
                child: _infoChip(
                  Icons.inventory_2_outlined,
                  'Commodity',
                  commodity.isEmpty ? '—' : commodity,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _infoChip(
                  Icons.storefront_outlined,
                  'Market',
                  market.isEmpty ? '—' : market,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              // Expanded(
              //   child: _infoChip(
              //     Icons.sell_outlined,
              //     'Price Type',
              //     pricetype.isEmpty ? '—' : pricetype,
              //   ),
              // ),
              if (confidence != null) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: _infoChip(
                    Icons.check_circle_outline,
                    'Confidence',
                    '${(confidence * 100).toStringAsFixed(1)}%',
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white70, size: 14),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
