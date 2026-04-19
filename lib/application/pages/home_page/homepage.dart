import 'package:farmer_assistance/application/core/services/routing/app_router.dart';
import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/home_page/widgets/feature_card.dart';
import 'package:farmer_assistance/application/pages/home_page/widgets/weather_card.dart';
import 'package:flutter/material.dart';

import '../../core/services/routing/routing_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryTeal,
      body: SafeArea(
        child: Container(
          color: Colors.grey[100],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const WeatherCard(),
                    // const Positioned(
                    //   bottom: -97,
                    //   left: 20,
                    //   right: 20,
                    //   child: QuoteCard(),
                    // ),
                  ],
                ),
                //const SizedBox(height: 100),

                // Grid of features
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 1.1,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppRouter.router.push(
                            PAGES.cropDiseasePrediction.screenPath,
                          );
                        },
                        child: FeatureCard(
                          icon: Icons.biotech,
                          title: "Disease Detection",
                          subtitle: "Detect crop diseases",
                          color: AppTheme.errorRed,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.router.push(
                            PAGES.smartIrrigationPage.screenPath,
                          );
                        },
                        child: FeatureCard(
                          icon: Icons.water_drop,
                          title: "Smart Irrigation",
                          subtitle: "Water crops smartly",
                          color: AppTheme.infoBlue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.router.push(
                            PAGES.fertilizerRecommendationPage.screenPath,
                          );
                        },
                        child: FeatureCard(
                          icon: Icons.science_outlined,
                          title: "Fertilizer Recommendation",
                          subtitle: "Best fertilizer advice",
                          color: AppTheme.warningOrange,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.router.push(
                            PAGES.marketTrendsPage.screenPath,
                          );
                        },
                        child: FeatureCard(
                          icon: Icons.trending_up,
                          title: "Market Trends",
                          subtitle: "Price predictions",
                          color: AppTheme.primaryTeal,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.router.push(PAGES.forecastPage.screenPath);
                        },
                        child: FeatureCard(
                          icon: Icons.wb_cloudy_outlined,
                          title: "Weather Insights",
                          subtitle: "See weather impact",
                          color: AppTheme.lightTeal,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.router.push(
                            PAGES.yieldPredictionPage.screenPath,
                          );
                        },
                        child: FeatureCard(
                          icon: Icons.agriculture,
                          title: "Yield Estimate",
                          subtitle: "Predict crop yields",
                          color: AppTheme.successGreen,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouter.router.push(
                            PAGES.cropRecommendationPage.screenPath,
                          );
                        },
                        child: FeatureCard(
                          icon: Icons.eco_outlined,
                          title: "Crop Recommendation",
                          subtitle: "Best crop advice",
                          color: AppTheme.deepTeal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
