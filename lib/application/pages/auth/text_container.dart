import 'package:flutter/material.dart';

class TextContainer extends StatefulWidget {
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
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  late bool _obscureText;

  bool get _isPasswordField =>
      widget.text == "Password" || widget.text == "Confirm Password";

  @override
  void initState() {
    super.initState();
    _obscureText = _isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    final outline = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Color(0xff00796B), width: 1.4),
    );

    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextField(
        controller: widget.controller,
        cursorColor: const Color(0xff00796B),
        obscureText: _isPasswordField ? _obscureText : false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: outline,
          enabledBorder: outline,
          focusedBorder: outline.copyWith(
            borderSide: const BorderSide(color: Color(0xff00796B), width: 1.7),
          ),
          prefixIcon: Icon(widget.icon, color: const Color(0xff00796B)),
          hintText: widget.text,
          hintStyle: const TextStyle(color: Colors.black54),
          suffixIcon: _isPasswordField
              ? IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xff00796B),
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
