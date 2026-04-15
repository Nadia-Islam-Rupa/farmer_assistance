import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/yield_estimation_response_model.dart';

class YieldResultCard extends StatefulWidget {
  const YieldResultCard({
    super.key,
    required this.result,
    required this.textTheme,
  });

  final YieldEstimationResponseModel result;
  final TextTheme textTheme;

  @override
  State<YieldResultCard> createState() => _YieldResultCardState();
}

class _YieldResultCardState extends State<YieldResultCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getYieldClass(double yield) {
    // Classify based on yield value (assuming t/ha)
    // These thresholds can be adjusted based on crop type
    if (yield >= 8.0) {
      return 'High Yield';
    } else if (yield >= 5.0) {
      return 'Medium Yield';
    } else {
      return 'Low Yield';
    }
  }

  String _formatFeatureName(String key) {
    // Convert snake_case or camelCase to Title Case
    return key
        .replaceAllMapped(RegExp(r'[_\s]+|(?<=[a-z])(?=[A-Z])'), (match) => ' ')
        .split(' ')
        .map(
          (word) => word.isEmpty
              ? ''
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    final predictedYield = widget.result.predictedYield ?? 0;
    // Determine yield class based on predicted yield value
    final yieldClass = _getYieldClass(predictedYield);
    final confidencePercent = ((widget.result.confidence ?? 0) * 100)
        .toStringAsFixed(1);

    final isHighYield = yieldClass.toLowerCase().contains('high');
    final cardColor = isHighYield
        ? AppTheme.primaryTeal
        : const Color(0xffF57C00);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Card(
            elevation: 4,
            shadowColor: cardColor.withValues(alpha: 0.3),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    isHighYield
                        ? const Color(0xffE8F5E9).withValues(alpha: 0.2)
                        : const Color(0xffFFF3E0).withValues(alpha: 0.2),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: cardColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            isHighYield
                                ? Icons.trending_up_rounded
                                : Icons.agriculture_outlined,
                            color: cardColor,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Estimated Yield Result',
                                style: widget.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff174A44),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Based on your inputs',
                                style: widget.textTheme.bodySmall?.copyWith(
                                  color: const Color(0xff5D7D78),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: cardColor.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: cardColor.withValues(alpha: 0.2),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Estimated Yield',
                                style: widget.textTheme.bodyMedium?.copyWith(
                                  color: const Color(0xff5D7D78),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    predictedYield.toStringAsFixed(1),
                                    style: widget.textTheme.headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: cardColor,
                                        ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    widget.result.yieldUnit ?? 't/ha',
                                    style: widget.textTheme.bodyMedium
                                        ?.copyWith(
                                          color: const Color(0xff5D7D78),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Divider(
                            color: cardColor.withValues(alpha: 0.2),
                            thickness: 1,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Classification',
                                style: widget.textTheme.bodyMedium?.copyWith(
                                  color: const Color(0xff5D7D78),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: cardColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  yieldClass,
                                  style: widget.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: cardColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xffF8FCFB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.analytics_outlined,
                            color: AppTheme.deepTeal,
                            size: 22,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Confidence Level',
                                  style: widget.textTheme.bodySmall?.copyWith(
                                    color: const Color(0xff5D7D78),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: LinearProgressIndicator(
                                          value: widget.result.confidence ?? 0,
                                          backgroundColor: const Color(
                                            0xffD3E6E2,
                                          ),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                cardColor,
                                              ),
                                          minHeight: 8,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '$confidencePercent%',
                                      style: widget.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: cardColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.result.featureImportance != null &&
                        widget
                            .result
                            .featureImportance!
                            .features
                            .isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Impact Factors',
                        style: widget.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff174A44),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...widget.result.featureImportance!.features.entries.map((
                        entry,
                      ) {
                        final percentage = (entry.value * 100).toStringAsFixed(
                          0,
                        );
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  _formatFeatureName(entry.key),
                                  style: widget.textTheme.bodySmall?.copyWith(
                                    color: const Color(0xff5D7D78),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: LinearProgressIndicator(
                                          value: entry.value,
                                          backgroundColor: const Color(
                                            0xffE8F5E9,
                                          ),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                cardColor.withValues(
                                                  alpha: 0.7,
                                                ),
                                              ),
                                          minHeight: 6,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: 35,
                                      child: Text(
                                        '$percentage%',
                                        style: widget.textTheme.bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xff174A44),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
