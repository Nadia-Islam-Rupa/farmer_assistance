import 'package:farmer_assistance/auth/text_container.dart';
import 'package:farmer_assistance/auth/wave_clip.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Logdash(),
          SingleChildScrollView(
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
                  TextContainer(text: "Name", icon: Icons.person),
                  SizedBox(height: 15),
                  TextContainer(text: "Email", icon: Icons.email),
                  SizedBox(height: 15),
                  TextContainer(text: "Password", icon: Icons.lock),
                  SizedBox(height: 15),
                  TextContainer(text: "Confirm Password", icon: Icons.lock),
                  SizedBox(height: 30),
                  Container(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
