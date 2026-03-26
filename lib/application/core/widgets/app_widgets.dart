import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Reusable gradient header card used across pages
class AppGradientHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? locationLabel;
  final bool showLocation;

  const AppGradientHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.locationLabel,
    this.showLocation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.spacingXL),
      decoration: AppTheme.gradientContainer(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                ),
                child: Icon(icon, color: AppTheme.textWhite, size: 28),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textWhite,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingM),
          Text(
            subtitle,
            style: TextStyle(
              color: AppTheme.textWhite.withValues(alpha: 0.95),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          if (showLocation && locationLabel != null) ...[
            const SizedBox(height: AppTheme.spacingS),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.lightGreenAccent.shade400,
                  size: 16,
                ),
                const SizedBox(width: AppTheme.spacingXS),
                Expanded(
                  child: Text(
                    'Location: $locationLabel',
                    style: TextStyle(
                      color: AppTheme.textWhite.withValues(alpha: 0.9),
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Reusable white card with shadow
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final List<BoxShadow>? boxShadow;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.radius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(AppTheme.spacingXL),
      decoration: AppTheme.cardDecoration(radius: radius, boxShadow: boxShadow),
      child: child,
    );
  }
}

/// Reusable section header
class AppSectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;

  const AppSectionHeader({
    super.key,
    required this.title,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color ?? AppTheme.primaryTeal, size: 24),
        const SizedBox(width: AppTheme.spacingS),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color ?? AppTheme.primaryTeal,
          ),
        ),
      ],
    );
  }
}

/// Reusable gradient result card
class AppResultCard extends StatelessWidget {
  final String title;
  final String emoji;
  final Widget child;

  const AppResultCard({
    super.key,
    required this.title,
    required this.emoji,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingXL),
      decoration: AppTheme.gradientContainer(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                decoration: BoxDecoration(
                  color: AppTheme.cardBackground,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                ),
                child: Text(emoji, style: const TextStyle(fontSize: 32)),
              ),
              const SizedBox(width: AppTheme.spacingL),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Result',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: AppTheme.spacingXS),
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppTheme.textWhite,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingL),
          child,
        ],
      ),
    );
  }
}

/// Reusable page scaffold with gradient background
class AppPageScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showBackButton;

  const AppPageScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryTeal,
        foregroundColor: AppTheme.textWhite,
        elevation: 0,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        automaticallyImplyLeading: showBackButton,
        actions: actions,
      ),
      body: Container(
        decoration: AppTheme.pageDecoration(),
        child: SafeArea(child: body),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

/// Reusable loading indicator
class AppLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const AppLoadingIndicator({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 24,
      height: size ?? 24,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppTheme.primaryTeal,
        ),
      ),
    );
  }
}

/// Reusable primary button
class AppPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;

  const AppPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? const AppLoadingIndicator(color: AppTheme.textWhite)
            : Icon(icon ?? Icons.check),
        label: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 54),
          backgroundColor: AppTheme.primaryTeal,
          foregroundColor: AppTheme.textWhite,
          elevation: 0,
          disabledBackgroundColor: AppTheme.primaryTeal.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium + 2),
          ),
        ),
      ),
    );
  }
}

/// Reusable secondary button (outlined)
class AppSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const AppSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon ?? Icons.refresh),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          foregroundColor: AppTheme.primaryTeal,
          side: const BorderSide(color: AppTheme.primaryTeal),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium + 2),
          ),
        ),
      ),
    );
  }
}
