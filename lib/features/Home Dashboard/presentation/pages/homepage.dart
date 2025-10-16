import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/action_card.dart';
import '../widgets/weather_info.dart';
import '../providers/page_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  final List<List<Map<String, dynamic>>> featurePages = [
    [
      {
        'color': const Color(0xFFE6F7F4),
        'icon': Icons.document_scanner_rounded,
        'title': 'Disease Scan',
        'subtitle': 'Check plant health',
      },
      {
        'color': const Color(0xFFE8F0FE),
        'icon': Icons.bar_chart_rounded,
        'title': 'Yield Prediction',
        'subtitle': 'Forecast harvest',
      },
      {
        'color': const Color(0xFFE8F8E8),
        'icon': Icons.eco_rounded,
        'title': 'Fertilizer Guide',
        'subtitle': 'Nutrient recommendations',
      },
      {
        'color': const Color(0xFFF3E8FF),
        'icon': Icons.water_drop_rounded,
        'title': 'Water Schedule',
        'subtitle': 'Irrigation planning',
      },
    ],
    [
      {
        'color': const Color(0xFFFFE9E3),
        'icon': Icons.chat_bubble_outline_rounded,
        'title': 'AI Chatbot',
        'subtitle': 'Ask farming queries',
      },
      {
        'color': const Color(0xFFEAF7FF),
        'icon': Icons.thermostat_auto_rounded,
        'title': 'Soil Monitor',
        'subtitle': 'Track soil data',
      },
      {
        'color': const Color(0xFFE8F5E9),
        'icon': Icons.spa_rounded,
        'title': 'Crop Suggestion',
        'subtitle': 'Best crop for soil',
      },
      {
        'color': const Color(0xFFFBE9E7),
        'icon': Icons.cloud_queue_rounded,
        'title': 'Weather Alerts',
        'subtitle': 'Rain & heat warnings',
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final Color tealColor = Colors.teal;
    // final currentPage = ref.watch(pageProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Morning",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "John's Farm",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: tealColor,
                    child: const Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Weather Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Weather",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.wb_sunny_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "24°C",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Partly Cloudy",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherInfo(label: "Humidity", value: '68%'),
                        WeatherInfo(label: "Wind", value: "12 km/h"),
                        WeatherInfo(label: "Rain", value: "20%"),
                        WeatherInfo(label: "UV Index", value: "6"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Quick Actions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // ✅ Horizontal scroll + indicator
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          ref.read(pageProvider.notifier).setPage(index);
                        },
                        itemCount: featurePages.length,
                        itemBuilder: (context, pageIndex) {
                          final items = featurePages[pageIndex];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: GridView.count(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 1.05,
                              children: items
                                  .map(
                                    (f) => ActionCard(
                                      color: f['color'],
                                      icon: f['icon'],
                                      title: f['title'],
                                      subtitle: f['subtitle'],
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: featurePages.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 6,
                        expansionFactor: 4,
                        activeDotColor: tealColor,
                        dotColor: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
