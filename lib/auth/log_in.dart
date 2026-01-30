import 'package:farmer_assistance/auth/wave_clip.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔷 Gradient Header
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: size.height * 0.42,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff00796B), // Deep Teal
                      Color(0xff26A69A), // Teal Accent
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.agriculture, size: 70, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "FarmAI",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                  Container(
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
                  const SizedBox(height: 20),

                  const Center(child: Text("OR")),

                  const SizedBox(height: 16),

                  // 🔹 Social Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(Icons.facebook),
                      _socialIcon(Icons.g_mobiledata),
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

Widget _socialIcon(IconData icon) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: 45,
    width: 45,
    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff00796B)),
    child: Icon(icon, color: Colors.white, size: 30),
  );
}
