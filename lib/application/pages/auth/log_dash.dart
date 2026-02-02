import 'package:farmer_assistance/application/core/services/routing/app_router.dart';
import 'package:farmer_assistance/application/pages/auth/wave_clip.dart';
import 'package:flutter/material.dart';

import '../../core/services/routing/routing_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔷 Gradient Header
            Logdash(),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: const Text(
                      "Welcome !",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Create Account Screen
                      AppRouter.router.push(PAGES.createAccountPage.screenPath);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff00796B),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Create Account ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      AppRouter.router.push(PAGES.loginPage.screenPath);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff00796B)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Login ",
                          style: TextStyle(
                            color: Color(0xff00796B),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Center(child: Text("OR")),

                  const SizedBox(height: 16),

                  // 🔹 Social Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialIcon("assets/facebook.png"),
                      GestureDetector(
                        onTap: () {},
                        child: socialIcon("assets/google.png"),
                      ),
                      socialIcon("assets/linkedin.png"),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Sign in with another account",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
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

Widget socialIcon(String icon) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: 45,
    width: 45,
    decoration: BoxDecoration(shape: BoxShape.circle),
    child: Image.asset(icon, height: 20, width: 20),
  );
}
