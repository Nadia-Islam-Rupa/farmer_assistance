import 'package:farmer_assistance/presentation/crop_disease_detection/image_upload.dart';
import 'package:farmer_assistance/presentation/crop_disease_detection/tips_section.dart';
import 'package:flutter/material.dart';

class UploadLeafScreen extends StatelessWidget {
  const UploadLeafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: const Text(
          'Disease Detection',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade200, Colors.green.shade100],
                  ),

                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
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
              const SizedBox(height: 20),
              const TipsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
