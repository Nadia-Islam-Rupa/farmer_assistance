import 'package:flutter/material.dart';

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
              const WeatherCard(),
              const SizedBox(height: 14),
              const QuoteCard(),
              const SizedBox(height: 20),

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

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF009688), Color(0xFF26A69A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          const Text(
            "Good Morning!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "October 22, 2024",
            style: TextStyle(
              color: Colors.white,
              //color: Colors.teal.shade100,
            ),
          ),
          const SizedBox(height: 18),

          // Weather row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Temperature box
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "28°C\nSunny",
                        style: TextStyle(color: Colors.white, height: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Humidity box
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Humidity: 65%\nWind: 12 km/h",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, height: 1.2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//////////////////////

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.format_quote_rounded, color: Colors.teal, size: 20),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  "The farmer is the only man in our economy who buys everything at retail, "
                  "sells everything at wholesale, and pays the freight both ways.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "- John F. Kennedy",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////
///

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(child: Icon(icon, color: Colors.black54)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
