import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/auth/reset_password_page/bloc/reset_password_bloc.dart';
import 'package:farmer_assistance/application/pages/auth/text_container.dart';
import 'package:farmer_assistance/application/pages/auth/wave_clip.dart';
import 'package:farmer_assistance/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/utils.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordBloc>(),
      child: const _ResetPasswordView(),
    );
  }
}

class _ResetPasswordView extends StatefulWidget {
  const _ResetPasswordView();

  @override
  State<_ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<_ResetPasswordView> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ErrorResetPasswordState) {
            Utils.showSnackBar(context, state.message, AppTheme.errorRed);
          } else if (state is SuccessResetPasswordState) {
            Utils.showSnackBar(
              context,
              "Password reset successfully! Please log in with your new password.",
              AppTheme.primaryTeal,
            );
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
                    const Center(
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        "Enter your new password below",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextContainer(
                      text: "Password",
                      icon: Icons.lock,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 15),
                    TextContainer(
                      text: "Confirm Password",
                      icon: Icons.lock_outline,
                      controller: _confirmPasswordController,
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                      builder: (context, state) {
                        final isLoading = state is LoadingResetPasswordState;
                        return GestureDetector(
                          onTap: isLoading
                              ? null
                              : () {
                                  context.read<ResetPasswordBloc>().add(
                                    ResetPasswordEvent.started(
                                      password: _passwordController.text,
                                      confirmPassword:
                                          _confirmPasswordController.text,
                                    ),
                                  );
                                },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
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
                                      "Reset Password",
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
                          _buildNotePoint(
                            "• Password must be at least 8 characters",
                          ),
                          _buildNotePoint(
                            "• Must include uppercase and lowercase letters",
                          ),
                          _buildNotePoint("• Must include a number"),
                          _buildNotePoint(
                            "• Must include a special character (!@#\$&*~%^)",
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
