// ignore_for_file: deprecated_member_use

import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  static const String _lastUpdated = "April 19, 2026";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: AppTheme.primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildContent(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.privacy_tip_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Privacy Policy",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Last updated: $_lastUpdated",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildIntroCard(),
          const SizedBox(height: 12),
          _buildSection(
            number: "1",
            title: "Information We Collect",
            icon: Icons.data_usage_outlined,
            content: [
              _PolicyPoint(
                subtitle: "Account Information",
                text:
                    "When you register, we collect your full name and email address. This is used to create and manage your account.",
              ),
              _PolicyPoint(
                subtitle: "Profile Data",
                text:
                    "You may optionally upload a profile photo. This image is securely stored and only used to personalize your account.",
              ),
              _PolicyPoint(
                subtitle: "Location Data",
                text:
                    "We collect your device's approximate location (with your permission) to provide weather forecasts, irrigation recommendations, and location-specific agricultural advice.",
              ),
              _PolicyPoint(
                subtitle: "Uploaded Images",
                text:
                    "Photos of crop leaves you upload for disease detection are processed by our AI model. These images may be stored temporarily to generate results and improve model accuracy.",
              ),
              _PolicyPoint(
                subtitle: "Usage Data",
                text:
                    "We collect anonymized data about how you interact with the app (features used, session duration) to improve user experience. This data does not identify you personally.",
              ),
              _PolicyPoint(
                subtitle: "Device Information",
                text:
                    "We may collect device type, operating system version, and app version to diagnose technical issues and ensure compatibility.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "2",
            title: "How We Use Your Information",
            icon: Icons.settings_outlined,
            content: [
              _PolicyPoint(text: "To create and maintain your user account."),
              _PolicyPoint(
                text:
                    "To provide AI-powered agricultural features including crop disease detection, irrigation planning, fertilizer recommendations, yield prediction, and market trend analysis.",
              ),
              _PolicyPoint(
                text:
                    "To deliver localized weather forecasts and farming advisories based on your location.",
              ),
              _PolicyPoint(
                text:
                    "To respond to your support requests and improve the application.",
              ),
              _PolicyPoint(
                text:
                    "To send important service notifications such as account verification emails and password reset links.",
              ),
              _PolicyPoint(
                text:
                    "To analyze anonymized usage patterns to improve app features and performance.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "3",
            title: "Data Sharing & Disclosure",
            icon: Icons.share_outlined,
            content: [
              _PolicyPoint(
                text:
                    "We do not sell, trade, or rent your personal information to third parties.",
              ),
              _PolicyPoint(
                subtitle: "Service Providers",
                text:
                    "We use trusted third-party services to operate the app, including Supabase (authentication and database) and AI model APIs. These providers are contractually obligated to protect your data.",
              ),
              _PolicyPoint(
                subtitle: "Legal Requirements",
                text:
                    "We may disclose information if required by law, court order, or government regulation, or to protect the rights and safety of our users.",
              ),
              _PolicyPoint(
                subtitle: "Business Transfers",
                text:
                    "In the event of a merger or acquisition, your data may be transferred as part of the business assets. You will be notified of any such change.",
              ),
              _PolicyPoint(
                text:
                    "Aggregated, anonymized data (with no personally identifiable information) may be shared for research or analytics purposes.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "4",
            title: "Data Security",
            icon: Icons.security_outlined,
            content: [
              _PolicyPoint(
                text:
                    "We implement industry-standard security measures including encryption in transit (HTTPS/TLS) and at rest to protect your data.",
              ),
              _PolicyPoint(
                text:
                    "Authentication is handled securely through Supabase, which uses bcrypt password hashing and JWT token-based sessions.",
              ),
              _PolicyPoint(
                text:
                    "Access to user data is restricted to authorized personnel only, on a need-to-know basis.",
              ),
              _PolicyPoint(
                text:
                    "While we take strong measures to protect your information, no digital transmission is 100% secure. We encourage you to use a strong password and keep it confidential.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "5",
            title: "Data Retention",
            icon: Icons.storage_outlined,
            content: [
              _PolicyPoint(
                text:
                    "We retain your account data for as long as your account is active or as needed to provide services.",
              ),
              _PolicyPoint(
                text:
                    "Crop images uploaded for disease detection are processed and may be deleted after a short retention period unless you save the results.",
              ),
              _PolicyPoint(
                text:
                    "Upon account deletion, your personal data will be removed from our active systems within 30 days, except where retention is required by law.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "6",
            title: "Your Rights",
            icon: Icons.verified_user_outlined,
            content: [
              _PolicyPoint(
                subtitle: "Access",
                text:
                    "You have the right to request a copy of the personal data we hold about you.",
              ),
              _PolicyPoint(
                subtitle: "Correction",
                text:
                    "You can update your profile name and photo directly in the app at any time.",
              ),
              _PolicyPoint(
                subtitle: "Deletion",
                text:
                    "You may request deletion of your account and associated data by contacting us.",
              ),
              _PolicyPoint(
                subtitle: "Opt-out",
                text:
                    "You can revoke location access permissions through your device settings at any time.",
              ),
              _PolicyPoint(
                subtitle: "Data Portability",
                text:
                    "You may request a copy of your data in a machine-readable format.",
              ),
              _PolicyPoint(
                text:
                    "To exercise any of these rights, contact us at privacy@farmerassistance.com.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "7",
            title: "Permissions We Request",
            icon: Icons.admin_panel_settings_outlined,
            content: [
              _PolicyPoint(
                subtitle: "Camera & Storage",
                text:
                    "Used to capture or select crop photos for disease detection. We do not access your gallery without your action.",
              ),
              _PolicyPoint(
                subtitle: "Location",
                text:
                    "Used to fetch weather data and provide location-based agricultural recommendations. This is optional and can be denied.",
              ),
              _PolicyPoint(
                subtitle: "Internet",
                text:
                    "Required for connecting to our cloud services, AI models, and weather APIs.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "8",
            title: "Children's Privacy",
            icon: Icons.child_care_outlined,
            content: [
              _PolicyPoint(
                text:
                    "Farmer Assistance is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13.",
              ),
              _PolicyPoint(
                text:
                    "If you are a parent or guardian and believe your child has provided us with personal data, please contact us immediately so we can take appropriate action.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "9",
            title: "Third-Party Services",
            icon: Icons.link_outlined,
            content: [
              _PolicyPoint(
                text:
                    "Our app may include links to third-party websites or services. We are not responsible for the privacy practices of those third parties.",
              ),
              _PolicyPoint(
                subtitle: "Supabase",
                text:
                    "Handles authentication and secure data storage. Their privacy policy applies to data processed through their platform.",
              ),
              _PolicyPoint(
                subtitle: "Weather APIs",
                text:
                    "We use weather data APIs that may receive your approximate location to return forecast data.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildSection(
            number: "10",
            title: "Changes to This Policy",
            icon: Icons.update_outlined,
            content: [
              _PolicyPoint(
                text:
                    "We may update this Privacy Policy from time to time. We will notify you of significant changes via email or an in-app notification.",
              ),
              _PolicyPoint(
                text:
                    "Your continued use of the app after policy updates constitutes your acceptance of the revised policy.",
              ),
              _PolicyPoint(
                text:
                    "We encourage you to review this policy periodically. The 'Last Updated' date at the top reflects the most recent revision.",
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildContactCard(),
        ],
      ),
    );
  }

  Widget _buildIntroCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F2F1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryTeal.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: AppTheme.primaryTeal,
            size: 20,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Your privacy matters to us. This policy explains how Farmer Assistance collects, uses, and protects your personal information when you use our application.",
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.deepTeal,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String number,
    required String title,
    required IconData icon,
    required List<_PolicyPoint> content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2F1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryTeal,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(icon, color: AppTheme.primaryTeal, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.deepTeal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content.asMap().entries.map((entry) {
                final isLast = entry.key == content.length - 1;
                final point = entry.value;
                return Column(
                  children: [
                    _buildPolicyPoint(point),
                    if (!isLast) const SizedBox(height: 10),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyPoint(_PolicyPoint point) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: AppTheme.primaryTeal,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                if (point.subtitle != null)
                  TextSpan(
                    text: "${point.subtitle}: ",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                      height: 1.5,
                    ),
                  ),
                TextSpan(
                  text: point.text,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.lightGradient,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryTeal.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.contact_mail_outlined,
                color: AppTheme.primaryTeal,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "If you have any questions, concerns, or requests about this Privacy Policy or your personal data, please reach out to us:",
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          _buildContactRow(
            Icons.email_outlined,
            "privacy@farmerassistance.com",
          ),
          const SizedBox(height: 6),
          _buildContactRow(
            Icons.support_agent_outlined,
            "support@farmerassistance.com",
          ),
          const SizedBox(height: 14),
          Text(
            "We will respond to your request within 30 business days.",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryTeal, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: AppTheme.primaryTeal,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _PolicyPoint {
  final String? subtitle;
  final String text;

  _PolicyPoint({this.subtitle, required this.text});
}
