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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
