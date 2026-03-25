import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final yieldProvider = StateProvider<double?>((ref) => null);

class YieldPredictionPage extends ConsumerWidget {
  const YieldPredictionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yield = ref.watch(yieldProvider);

    final cropController = TextEditingController();
    final areaController = TextEditingController();
    final rainfallController = TextEditingController();
    final tempController = TextEditingController();
    final pesticideController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("🌾 Yield Prediction"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 Title
            const Text(
              "Predict crop yield using AI",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 20),

            // 🔹 Crop Input
            TextField(
              controller: cropController,
              decoration: const InputDecoration(
                labelText: "Crop (Item)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Area Input
            TextField(
              controller: areaController,
              decoration: const InputDecoration(
                labelText: "Area",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Rainfall
            TextField(
              controller: rainfallController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Rainfall (mm/year)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Temperature
            TextField(
              controller: tempController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Temperature (°C)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Pesticides
            TextField(
              controller: pesticideController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Pesticides (tonnes)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Predict Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  double fakeResult = 5234.5;

                  ref.read(yieldProvider.notifier).state = fakeResult;
                },
                child: const Text("Predict Yield"),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Result
            if (yield != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        "📊 Predicted Yield",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${yield.toStringAsFixed(2)} hg/ha",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
