// ignore_for_file: deprecated_member_use

import 'package:farmer_assistance/application/core/services/routing/app_router.dart';
import 'package:farmer_assistance/application/core/services/routing/routing_utils.dart';
import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const String _appVersion = "1.0.0";
  static const String _buildNumber = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: AppTheme.primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppHeader(),
            const SizedBox(height: 16),
            _buildInfoSection(),
            const SizedBox(height: 16),
            _buildFeaturesSection(),
            const SizedBox(height: 16),
            _buildLegalSection(context),
            const SizedBox(height: 16),
            _buildDeveloperSection(),
            const SizedBox(height: 32),
            _buildFooter(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAppHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.agriculture_rounded,
              color: AppTheme.primaryTeal,
              size: 48,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Farmer Assistance",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Version $_appVersion (Build $_buildNumber)",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Empowering Farmers with AI",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.95),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: AppTheme.primaryTeal,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  "About the App",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "Farmer Assistance is an AI-powered agricultural platform designed to support farmers with data-driven insights. From detecting crop diseases to predicting yields and irrigation needs, the app brings precision farming to everyone's fingertips.",
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Built for both smallholder and commercial farmers, our goal is to reduce crop loss, optimize resource usage, and improve livelihoods through accessible technology.",
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesSection() {
    final features = [
      _FeatureItem(
        icon: Icons.biotech_outlined,
        color: AppTheme.successGreen,
        title: "Crop Disease Detection",
        description: "AI-powered leaf image analysis to identify diseases",
      ),
      _FeatureItem(
        icon: Icons.water_drop_outlined,
        color: AppTheme.infoBlue,
        title: "Smart Irrigation",
        description: "Precise water requirement calculations for your crops",
      ),
      _FeatureItem(
        icon: Icons.eco_outlined,
        color: AppTheme.primaryTeal,
        title: "Fertilizer Recommendations",
        description: "NPK-based fertilizer guidance for optimal soil health",
      ),
      _FeatureItem(
        icon: Icons.trending_up_outlined,
        color: AppTheme.warningOrange,
        title: "Market Trends",
        description: "Real-time commodity price tracking and predictions",
      ),
      _FeatureItem(
        icon: Icons.grain_outlined,
        color: AppTheme.deepTeal,
        title: "Yield Prediction",
        description: "Estimate your harvest before the season ends",
      ),
      _FeatureItem(
        icon: Icons.wb_sunny_outlined,
        color: Color(0xFFFF7043),
        title: "Weather Forecast",
        description: "Localized 7-day weather and agricultural advisories",
      ),
      _FeatureItem(
        icon: Icons.chat_bubble_outline_rounded,
        color: Color(0xFF7C4DFF),
        title: "AI Chatbot",
        description: "24/7 farming assistant for instant expert advice",
      ),
      _FeatureItem(
        icon: Icons.spa_outlined,
        color: AppTheme.lightGreenAccent,
        title: "Crop Recommendation",
        description: "Find the best crops for your soil and climate",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.star_outline_rounded,
                color: AppTheme.primaryTeal,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Key Features",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppTheme.cardShadow,
            ),
            child: Column(
              children: features.asMap().entries.map((entry) {
                final isLast = entry.key == features.length - 1;
                final feature = entry.value;
                return Column(
                  children: [
                    _buildFeatureRow(feature),
                    if (!isLast)
                      Divider(
                        height: 1,
                        color: Colors.grey.shade100,
                        indent: 56,
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(_FeatureItem feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: feature.color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(feature.icon, color: feature.color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  feature.description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.gavel_outlined, color: AppTheme.primaryTeal, size: 20),
              SizedBox(width: 8),
              Text(
                "Legal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppTheme.cardShadow,
            ),
            child: Column(
              children: [
                _buildLegalTile(
                  icon: Icons.privacy_tip_outlined,
                  title: "Privacy Policy",
                  onTap: () =>
                      AppRouter.router.push(PAGES.privacyPolicyPage.screenPath),
                ),
                Divider(height: 1, color: Colors.grey.shade100, indent: 56),
                _buildLegalTile(
                  icon: Icons.description_outlined,
                  title: "Terms of Service",
                  onTap: () => _showTermsDialog(context),
                ),
                Divider(height: 1, color: Colors.grey.shade100, indent: 56),
                _buildLegalTile(
                  icon: Icons.copyright_outlined,
                  title: "Open Source Licenses",
                  onTap: () => showLicensePage(
                    context: context,
                    applicationName: "Farmer Assistance",
                    applicationVersion: _appVersion,
                  ),
                  showChevron: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showChevron = true,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppTheme.primaryTeal, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
            if (showChevron)
              Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDeveloperSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.code_rounded, color: AppTheme.primaryTeal, size: 20),
                SizedBox(width: 8),
                Text(
                  "Developer Info",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            _buildInfoRow(
              Icons.business_outlined,
              "Developer",
              "Farmer Assistance Team",
            ),
            const SizedBox(height: 10),
            _buildInfoRow(
              Icons.email_outlined,
              "Contact",
              "support@farmerassistance.com",
            ),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.public_outlined, "Platform", "Android & iOS"),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.build_circle_outlined, "Framework", "Flutter"),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.calendar_today_outlined, "Released", "2024"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryTeal, size: 18),
        const SizedBox(width: 10),
        Text(
          "$label:",
          style: const TextStyle(
            fontSize: 13,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Icon(
          Icons.agriculture_rounded,
          color: AppTheme.primaryTeal,
          size: 28,
        ),
        const SizedBox(height: 8),
        const Text(
          "Farmer Assistance",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryTeal,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "© 2024 Farmer Assistance Team. All rights reserved.",
          style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
        ),
      ],
    );
  }

  void _showTermsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Terms of Service",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "By using Farmer Assistance, you agree to use the app for lawful agricultural purposes only. "
            "The AI predictions and recommendations are advisory in nature and should not replace professional "
            "agronomist advice. We reserve the right to update these terms at any time with notice.\n\n"
            "Unauthorized use, redistribution, or commercial exploitation of the app content is prohibited. "
            "For full terms, contact us at support@farmerassistance.com.",
            style: TextStyle(
              color: AppTheme.textSecondary,
              height: 1.6,
              fontSize: 13,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Close",
              style: TextStyle(
                color: AppTheme.primaryTeal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem {
  final IconData icon;
  final Color color;
  final String title;
  final String description;

  _FeatureItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
  });
}
