import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {

  const TextForm.full({
    super.key,
    required this.label,
    this.ratio = 1.0
  });

  final String label;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * ratio,
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
