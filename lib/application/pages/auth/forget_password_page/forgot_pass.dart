import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/auth/forget_password_page/bloc/forget_password_bloc.dart';
import 'package:farmer_assistance/application/pages/auth/text_container.dart';
import 'package:farmer_assistance/application/pages/auth/wave_clip.dart';
import 'package:farmer_assistance/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/utils.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgetPasswordBloc>(),
      child: ForgotPass(),
    );
  }
}

class ForgotPass extends StatelessWidget {
  ForgotPass({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ErrorForgetPasswordState) {
            Utils.showSnackBar(context, state.message, AppTheme.errorRed);
          } else if (state is SuccessForgetPasswordState) {
            // Capture messenger before popping so snackbar shows on parent.
            final messenger = ScaffoldMessenger.of(context);
            messenger.hideCurrentSnackBar();
            messenger.showSnackBar(
              SnackBar(
                content: Text(state.message),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 4),
                backgroundColor: AppTheme.primaryTeal,
              ),
            );
            Navigator.of(context).pop();
          }
        },
        child: Column(
          children: [
            Logdash(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextContainer(
                      text: "Enter Your Email",
                      icon: Icons.email,
                      controller: emailController,
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
                      builder: (context, state) {
                        final isLoading = state is LoadingForgetPasswordState;
                        return GestureDetector(
                          onTap: isLoading
                              ? null
                              : () {
                                  context.read<ForgetPasswordBloc>().add(
                                    ForgetPasswordEvent.started(
                                      email: emailController.text,
                                    ),
                                  );
                                },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.primaryTeal),
                              color: isLoading
                                  ? AppTheme.primaryTeal.withValues(alpha: 0.7)
                                  : AppTheme.primaryTeal,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: isLoading
                                  ? const SizedBox(
                                      height: 22,
                                      width: 22,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2F1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF80CBC4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: AppTheme.primaryTeal,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Important Notes",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff004D40),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildNotePoint(
                            "• A password reset link will be sent to your email",
                          ),
                          _buildNotePoint("• The reset link is valid for 1 hour only"),
                          _buildNotePoint(
                            "• You can request a new link if the previous one expires",
                          ),
                          _buildNotePoint(
                            "• Make sure to use a valid email address registered with this app",
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3E0),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFFFB74D)),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.warning_amber_rounded,
                                  color: Color(0xFFE65100),
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    "Don't forget to check your spam/junk folder if you don't see the email",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFFE65100),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  Widget _buildNotePoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF424242),
          height: 1.4,
        ),
      ),
    );
  }
}
