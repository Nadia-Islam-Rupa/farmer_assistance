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
            return Utils.showSnackBar(context, state.message);
          } else if (state is LoadingForgetPasswordState) {
            return Utils.showSnackBar(context, "Sending reset link...");
          } else if (state is SuccessForgetPasswordState) {
            Navigator.of(context).pop();
            return Utils.showSnackBar(context, state.message);
          }
        },
        child: Column(
          children: [
            Logdash(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextContainer(
                    text: "Enter Your Email",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
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
                        border: Border.all(color: Color(0xff00796B)),
                        color: Color(0xff00796B),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFE0F2F1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFF80CBC4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.info_outline, color: Color(0xff00796B), size: 20),
                            SizedBox(width: 8),
                            Text(
                              "Important Notes",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff004D40),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        _buildNotePoint("• Firebase will send a password reset link to your email"),
                        _buildNotePoint("• The reset link is valid for 1 hour only"),
                        _buildNotePoint("• You can request a new link if the previous one expires"),
                        _buildNotePoint("• Make sure to use a valid email address registered with this app"),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFFFFB74D)),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.warning_amber_rounded, color: Color(0xFFE65100), size: 18),
                              SizedBox(width: 8),
                              Expanded(
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
          ],
        ),
      ),
    );
  }

  Widget _buildNotePoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFF424242),
          height: 1.4,
        ),
      ),
    );
  }
}
