import 'package:farmer_assistance/application/core/services/routing/app_router.dart';
import 'package:farmer_assistance/application/core/theme/app_theme.dart';
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
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Disease Detection'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    Utils.showSnackBar(context, state.message, AppTheme.errorRed);
                  }
                  if (state is LoadingCropDiseaseState) {
                    Utils.showSnackBar(
                      context,
                      "Loading...",
                      AppTheme.primaryTeal,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingCropDiseaseState) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.primaryTeal,
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
                                    backgroundColor: AppTheme.lightTeal.withValues(alpha: 0.15),
                                    radius: 20,
                                    child: const Icon(
                                      Icons.local_florist,
                                      color: AppTheme.primaryTeal,
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
