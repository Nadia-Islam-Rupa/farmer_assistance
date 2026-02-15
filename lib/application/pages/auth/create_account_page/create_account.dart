import 'package:farmer_assistance/application/core/services/routing/app_router.dart';
import 'package:farmer_assistance/application/pages/auth/create_account_page/bloc/create_account_bloc.dart';
import 'package:farmer_assistance/application/pages/auth/text_container.dart';
import 'package:farmer_assistance/application/pages/auth/wave_clip.dart';
import 'package:farmer_assistance/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/utils.dart';
import '../../../core/services/routing/routing_utils.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateAccountBloc>(),
      child: CreateAccount(),
    );
  }
}

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreateAccountBloc, CreateAccountState>(
        listener: (context, state) {
          if (state is LoadingCreateAccountState) {
            Utils.showSnackBar(context, "Creating account...",Color(0xff00796B));
          }

          if (state is ErrorAccountCreateState) {
            Utils.showSnackBar(context, state.message,Colors.red);
          }

          if (state is SuccessCreateAccountState) {
            Utils.showSnackBar(context, "Successfully created account! Please check your email to verify your account.",Color(0xff00796B));
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
                          "Create Account",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextContainer(
                        text: "Name",
                        icon: Icons.person,
                        controller: nameController,
                      ),
                      SizedBox(height: 15),
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
                      SizedBox(height: 15),
                      TextContainer(
                        text: "Confirm Password",
                        icon: Icons.lock,
                        controller: confirmPasswordController,
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          // Handle Create Account action
                          // Navigator.pop(context);
                          context.read<CreateAccountBloc>().add(
                            CreateAccountEvent.started(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                              confirmPassword: confirmPasswordController.text,
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
                              "Create Account",
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
                          Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              AppRouter.router.pushReplacement(
                                PAGES.loginPage.screenPath,
                              );
                            },
                            child: Text(
                              "Log In Here",
                              style: TextStyle(
                                color: Color(0xff00796B),
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
