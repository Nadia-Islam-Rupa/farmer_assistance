import 'package:flutter/material.dart';

class ClimateImpactScreen extends StatelessWidget {
  const ClimateImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Climate Impact')),
      body: const Center(
        child: Text(
          'Climate impact details will be shown here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
