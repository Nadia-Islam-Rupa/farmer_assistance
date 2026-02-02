import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  const TextContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,

      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff00796B)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        cursorColor: Color(0xff00796B),
        obscureText: text == "Password"
            ? true
            : text == "Confirm Password"
            ? true
            : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Color(0xff00796B)),
          hintText: text,
        ),
      ),
    );
  }
}
