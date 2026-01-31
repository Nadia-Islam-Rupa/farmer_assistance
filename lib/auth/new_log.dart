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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [TextContainer(text: "Name", icon: Icons.person)],
            ),
          ),
        ],
      ),
    );
  }
}
