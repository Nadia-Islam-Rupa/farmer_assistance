import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff00796B),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '7-day agricultural weather insights',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 24),

                // Current Weather Card
                _buildCurrentWeatherCard(),
                SizedBox(height: 20),

                // 7-Day Forecast
                Text(
                  'Weekly Forecast',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                _buildWeeklyForecastList(),

                SizedBox(height: 20),

                // Agricultural Insights
                Text(
                  'Crop Insights',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                _buildInsightCard(
                  icon: Icons.water_drop,
                  title: 'Irrigation Alert',
                  description: 'Low rainfall expected. Consider irrigation.',
                  color: Colors.blue,
                ),
                SizedBox(height: 12),
                _buildInsightCard(
                  icon: Icons.wb_sunny,
                  title: 'Optimal Planting',
                  description: 'Good conditions for planting next 3 days.',
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentWeatherCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff00796B), Color(0xff26A69A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '28°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Partly Cloudy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.wb_cloudy,
                size: 80,
                color: Colors.white70,
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(color: Colors.white30),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeatherStat(Icons.water_drop, 'Humidity', '65%'),
              _buildWeatherStat(Icons.air, 'Wind', '12 km/h'),
              _buildWeatherStat(Icons.umbrella, 'Rain', '20%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherStat(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 24),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyForecastList() {
    final days = [
      {'day': 'Mon', 'high': '27°C', 'low': '22°C', 'icon': Icons.wb_sunny},
      {'day': 'Tue', 'high': '26°C', 'low': '21°C', 'icon': Icons.wb_cloudy},
      {'day': 'Wed', 'high': '28°C', 'low': '23°C', 'icon': Icons.wb_sunny},
      {'day': 'Thu', 'high': '25°C', 'low': '20°C', 'icon': Icons.cloud},
      {'day': 'Fri', 'high': '24°C', 'low': '19°C', 'icon': Icons.grain},
      {'day': 'Sat', 'high': '26°C', 'low': '21°C', 'icon': Icons.wb_cloudy},
      {'day': 'Sun', 'high': '27°C', 'low': '22°C', 'icon': Icons.wb_sunny},
    ];

    return Column(
      children: days.map((dayData) {
        return _buildDayForecast(
          dayData['day'] as String,
          dayData['high'] as String,
          dayData['low'] as String,
          dayData['icon'] as IconData,
        );
      }).toList(),
    );
  }

  Widget _buildDayForecast(String day, String high, String low, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              day,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              Icon(icon, color: Colors.orange, size: 24),
              SizedBox(width: 8),
              Text(
                high,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            low,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
