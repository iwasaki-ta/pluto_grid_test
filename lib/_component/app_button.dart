import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  const AppButton.common({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonHeight = 70,
    this.fontSize = 28,
  });

  const AppButton.big({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonHeight = 200,
    this.fontSize = 40,
  });

  final String text;
  final VoidCallback onPressed;
  final double buttonHeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        fixedSize: Size(double.maxFinite, buttonHeight),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF841238),
      ),
      onPressed: () => onPressed.call(),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
