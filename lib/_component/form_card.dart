import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  /// 通常のカード
  const FormCard({
    super.key,
    required this.title,
    required this.children,
    this.bottomPadding = 0,
  });

  /// 一番下のカード
  const FormCard.last({
    super.key,
    required this.title,
    required this.children,
    this.bottomPadding = 20,
  });

  final String title;
  final List<Widget> children;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: bottomPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 10),
              for (var widget in children) widget,
            ],
          ),
        ),
      ),
    );
  }
}
