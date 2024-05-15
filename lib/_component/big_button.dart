import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          fixedSize: const Size(double.maxFinite, 200),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF841238)),
      onPressed: () => onPressed.call(),
      child: Text(
        text,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}
