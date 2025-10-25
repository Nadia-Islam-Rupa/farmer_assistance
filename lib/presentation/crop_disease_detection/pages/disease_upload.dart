import 'package:farmer_assistance/presentation/crop_disease_detection/pages/image_upload.dart';
import 'package:farmer_assistance/presentation/crop_disease_detection/pages/tips_section.dart';
import 'package:flutter/material.dart';

class UploadLeafScreen extends StatelessWidget {
  const UploadLeafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'CropGuard AI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F9F2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '🩺 Disease Detection',
                        style: TextStyle(
                          color: Color(0xFF00B894),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Upload Leaf Image',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Take a clear photo of the affected leaf or upload an existing image for accurate disease detection and treatment recommendations.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 24),
                    const ImageUploadBox(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const TipsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
