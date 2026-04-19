import 'package:farmer_assistance/application/core/services/routing/app_router.dart';
import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/auth/text_container.dart';
import 'package:farmer_assistance/application/pages/auth/wave_clip.dart';
import 'package:farmer_assistance/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/utils.dart';
import '../../../core/services/routing/routing_utils.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<LoginBloc>(), child: LoginPages());
  }
}

class LoginPages extends StatelessWidget {
  LoginPages({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoadingLoginState) {
            Utils.showSnackBar(context, "Logging in...", AppTheme.primaryTeal);
          }

          if (state is ErrorLoginState) {
            Utils.showSnackBar(context, state.message, AppTheme.errorRed);
          }

          if (state is SuccessLoginState) {
            Utils.showSnackBar(context, "Welcome To FarmAI", AppTheme.primaryTeal);
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            Logdash(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Center(
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextContainer(
                        text: "Email",
                        icon: Icons.email,
                        controller: emailController,
                      ),
                      SizedBox(height: 15),
                      TextContainer(
                        text: "Password",
                        icon: Icons.lock,
                        controller: passwordController,
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          AppRouter.router.push(
                            PAGES.forgetPage.screenPath,
                          );
                        },
                        child: Text(
                          " Forgot Password?",
                          style: TextStyle(
                            color: AppTheme.primaryTeal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          context.read<LoginBloc>().add(
                            LoginEvent.started(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.primaryTeal),
                            color: AppTheme.primaryTeal,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              AppRouter.router.pushReplacement(
                                PAGES.createAccountPage.screenPath,
                              );
                            },
                            child: Text(
                              "Create Account Here",
                              style: TextStyle(
                                color: AppTheme.primaryTeal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
