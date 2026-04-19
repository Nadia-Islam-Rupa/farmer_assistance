// ignore_for_file: deprecated_member_use

import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  final List<_FaqItem> _faqs = [
    _FaqItem(
      question: "How does Crop Disease Detection work?",
      answer:
          "Upload a clear photo of your crop leaf using the Crop Disease Detection feature. Our AI model analyzes the image and identifies any diseases present, along with treatment recommendations. Ensure good lighting and a close-up shot for best results.",
    ),
    _FaqItem(
      question: "How does Smart Irrigation help me?",
      answer:
          "Smart Irrigation uses your location's weather data and soil parameters to calculate the optimal amount of water your crops need. Enter your crop type, soil details, and area size to get precise irrigation recommendations.",
    ),
    _FaqItem(
      question: "How do I get fertilizer recommendations?",
      answer:
          "Navigate to Fertilizer Tips from the home screen. Enter your soil's NPK values, pH level, crop type, and rainfall data. The system will suggest the most suitable fertilizer and application amount for your conditions.",
    ),
    _FaqItem(
      question: "How accurate is the yield prediction?",
      answer:
          "Yield Prediction uses machine learning models trained on agricultural data. The accuracy depends on the accuracy of the inputs you provide (soil type, season, crop variety, rainfall). Providing precise data leads to more reliable predictions.",
    ),
    _FaqItem(
      question: "How do I update my profile information?",
      answer:
          "Go to the Profile tab, tap 'Personal Information', and you can update your name and profile photo. Tap 'Save Changes' to apply the updates.",
    ),
    _FaqItem(
      question: "I forgot my password. What should I do?",
      answer:
          "On the login screen, tap 'Forgot Password?'. Enter your registered email address and we'll send you a password reset link. Check your spam folder if you don't see it in your inbox.",
    ),
    _FaqItem(
      question: "What crops does the app support?",
      answer:
          "The app supports a wide range of crops including rice, wheat, maize, cotton, sugarcane, vegetables, and many more. The crop disease detection model covers 30+ common crop diseases across multiple plant species.",
    ),
    _FaqItem(
      question: "Does the app work offline?",
      answer:
          "Most features require an internet connection as they rely on cloud-based AI models. Weather forecasts also require connectivity. Ensure you have a stable connection for the best experience.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: AppTheme.primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildFaqSection(),
            const SizedBox(height: 16),
            _buildContactSection(context),
            const SizedBox(height: 16),
            _buildTroubleshootingSection(),
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
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.support_agent_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "How can we help you?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Browse the FAQs below or contact our support team",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(Icons.quiz_outlined, "Frequently Asked Questions"),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppTheme.cardShadow,
            ),
            child: Column(
              children: _faqs.asMap().entries.map((entry) {
                final index = entry.key;
                final faq = entry.value;
                return Column(
                  children: [
                    _FaqTile(item: faq),
                    if (index < _faqs.length - 1)
                      Divider(
                        height: 1,
                        color: Colors.grey.shade200,
                        indent: 16,
                        endIndent: 16,
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

  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(Icons.contact_support_outlined, "Contact Us"),
          const SizedBox(height: 12),
          _buildContactCard(
            icon: Icons.email_outlined,
            title: "Email Support",
            subtitle: "support@farmerassistance.com",
            color: AppTheme.infoBlue,
            onTap: () => _showContactDialog(
              context,
              "Email Support",
              "Send your queries to:\nsupport@farmerassistance.com\n\nWe respond within 24–48 business hours.",
            ),
          ),
          const SizedBox(height: 10),
          _buildContactCard(
            icon: Icons.chat_bubble_outline_rounded,
            title: "AI Chatbot",
            subtitle: "Get instant answers from our AI assistant",
            color: AppTheme.successGreen,
            onTap: () => _showContactDialog(
              context,
              "AI Chatbot",
              "Use the Chatbot tab at the bottom of the screen for instant answers to your farming questions.",
            ),
          ),
          const SizedBox(height: 10),
          _buildContactCard(
            icon: Icons.bug_report_outlined,
            title: "Report a Bug",
            subtitle: "Help us improve the app",
            color: AppTheme.warningOrange,
            onTap: () => _showContactDialog(
              context,
              "Report a Bug",
              "To report a bug, please email us at:\nbug-report@farmerassistance.com\n\nInclude your device model, app version, and a description of the issue.",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTroubleshootingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(Icons.build_outlined, "Quick Tips"),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppTheme.cardShadow,
            ),
            child: Column(
              children: [
                _buildTipRow(
                  Icons.wifi_outlined,
                  "Check your internet connection if features aren't loading.",
                ),
                _buildTipDivider(),
                _buildTipRow(
                  Icons.update_outlined,
                  "Keep the app updated for the latest features and fixes.",
                ),
                _buildTipDivider(),
                _buildTipRow(
                  Icons.camera_alt_outlined,
                  "Use good lighting when capturing crop leaf photos.",
                ),
                _buildTipDivider(),
                _buildTipRow(
                  Icons.location_on_outlined,
                  "Enable location access for accurate weather and irrigation data.",
                ),
                _buildTipDivider(),
                _buildTipRow(
                  Icons.refresh_outlined,
                  "If the app behaves unexpectedly, try restarting it.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryTeal, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }

  Widget _buildTipRow(IconData icon, String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.primaryTeal, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipDivider() {
    return Divider(height: 1, color: Colors.grey.shade100);
  }

  void _showContactDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(color: AppTheme.textSecondary, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Got it",
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

class _FaqItem {
  final String question;
  final String answer;
  _FaqItem({required this.question, required this.answer});
}

class _FaqTile extends StatefulWidget {
  final _FaqItem item;
  const _FaqTile({required this.item});

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => _expanded = !_expanded),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.item.question,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppTheme.primaryTeal,
                    size: 22,
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: _expanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.item.answer,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
