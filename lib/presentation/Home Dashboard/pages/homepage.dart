import 'package:farmer_assistance/presentation/Home%20Dashboard/widgets/weather_card.dart';
import 'package:flutter/material.dart';

import '../widgets/feature_card.dart';
import '../widgets/quote_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Forecast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chatbot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const WeatherCard(),
                  const Positioned(
                    bottom: -125,
                    left: 20,
                    right: 20,
                    child: QuoteCard(),
                  ),
                ],
              ),
              const SizedBox(height: 150),

              // Grid of features
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.1,
                children: const [
                  FeatureCard(
                    icon: Icons.local_florist,
                    title: "Disease Prediction",
                    subtitle: "Detect crop diseases",
                    color: Colors.greenAccent,
                  ),
                  FeatureCard(
                    icon: Icons.event_note,
                    title: "Smart Scheduling",
                    subtitle: "Plan your farming",
                    color: Colors.tealAccent,
                  ),
                  FeatureCard(
                    icon: Icons.grass,
                    title: "Fertilizer Rec.",
                    subtitle: "Best fertilizer advice",
                    color: Colors.amberAccent,
                  ),
                  FeatureCard(
                    icon: Icons.trending_up,
                    title: "Market Forecast",
                    subtitle: "Price predictions",
                    color: Colors.purpleAccent,
                  ),
                  FeatureCard(
                    icon: Icons.cloud,
                    title: "Climate Impact",
                    subtitle: "Weather insights",
                    color: Colors.lightBlueAccent,
                  ),
                  FeatureCard(
                    icon: Icons.smart_toy_outlined,
                    title: "AI Chatbot",
                    subtitle: "Ask farming questions",
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
