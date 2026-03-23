import 'package:farmer_assistance/application/core/services/routing/app_router.dart';
import 'package:farmer_assistance/application/pages/crop_disease_detection/tips_section.dart';
import 'package:farmer_assistance/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../../core/services/routing/routing_utils.dart';
import 'bloc/crop_disease_bloc.dart';
import 'image_upload.dart';

class UploadLeafScreen extends StatelessWidget {
  const UploadLeafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CropDiseaseBloc>(),
      child: UploadLeaf(),
    );
  }
}

class UploadLeaf extends StatelessWidget {
  const UploadLeaf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gradient Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff00796B), Color(0xff26A69A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Disease Detection',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(width: 22),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Upload a leaf image to detect diseases\nand get treatment recommendations.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Upload Card
              BlocConsumer<CropDiseaseBloc, CropDiseaseState>(
                listener: (context, state) {
                  if (state is LoadedCropDiseaseState) {
                    AppRouter.router.push(
                      PAGES.cropDiseaseDetectionResult.screenPath,
                      extra: state.cropDiseaseModel,
                    );
                  }
                  if (state is ErrorCropDiseaseState) {
                    Utils.showSnackBar(context, state.message, Colors.red);
                  }
                  if (state is LoadingCropDiseaseState) {
                    Utils.showSnackBar(
                      context,
                      "Loading...",
                      Color(0xff00796B),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingCropDiseaseState) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff00796B),
                        ),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          padding: const EdgeInsets.all(20),
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
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(
                                      0xff26A69A,
                                    ).withOpacity(0.15),
                                    radius: 20,
                                    child: const Icon(
                                      Icons.local_florist,
                                      color: Color(0xff00796B),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    'Upload Leaf Image',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Take a clear photo of the affected leaf or browse from your device.',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ImageUploadBox(),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Tips Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const TipsSection(),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
