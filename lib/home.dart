import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff7f9f8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'AgriAI',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings_outlined, color: Colors.black87),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weather Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Sunny, 10:30 AM",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "28°C",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.wb_sunny_outlined,
                    size: 48,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Weather stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                WeatherStat(label: "Humidity", value: "75%"),
                WeatherStat(label: "Rainfall", value: "2mm"),
                WeatherStat(label: "Wind", value: "5 km/h"),
              ],
            ),
            const SizedBox(height: 20),

            // Feature Grid
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: const [
                FeatureCard(icon: LucideIcons.bug, title: "Detect Disease"),
                FeatureCard(
                  icon: LucideIcons.trendingUp,
                  title: "Predict Yield",
                ),
                FeatureCard(
                  icon: LucideIcons.flaskConical,
                  title: "Fertilizer Guide",
                ),
                FeatureCard(icon: LucideIcons.droplet, title: "Water Schedule"),
                FeatureCard(icon: LucideIcons.sprout, title: "Crop Suggestion"),
                FeatureCard(icon: LucideIcons.bot, title: "AI Chatbot"),
              ],
            ),
            const SizedBox(height: 24),

            // AI Tip of the Day
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                height: 160,
                child: const Text(
                  "AI Tip of the Day\nRotate your crops to improve soil health and reduce pest issues.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "AI Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture_outlined),
            label: "Crop Care",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// Reusable small components below

class WeatherStat extends StatelessWidget {
  final String label;
  final String value;
  const WeatherStat({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const FeatureCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.green, size: 32),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
