import 'package:farmer_assistance/auth/create_account.dart';
import 'package:farmer_assistance/auth/text_container.dart';
import 'package:farmer_assistance/auth/wave_clip.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Logdash(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Center(
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 25),
                TextContainer(text: "Email", icon: Icons.email),
                SizedBox(height: 15),
                TextContainer(text: "Password", icon: Icons.lock),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    // Handle Log In action
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccount(),
                          ),
                        );
                      },
                      child: Text(
                        "Create Account Here",
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
        ],
      ),
    );
  }
}
