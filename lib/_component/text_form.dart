import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KatakanaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;
    final String filteredText = newText.replaceAll(RegExp(r'[^ァ-ヶー]'), '');
    return newValue.copyWith(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm.full({
    super.key,
    required this.label,
    this.ratio = 1.0,
    this.keyboard,
    this.inputFormatter,
  });

  final String label;
  final double ratio;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * ratio,
            child: TextFormField(
              keyboardType: keyboard,
              inputFormatters: inputFormatter,
              style: const TextStyle(fontSize: 28),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '$labelを入力してください';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}

class KanaTextForm extends StatelessWidget {
  const KanaTextForm.full({
    super.key,
    required this.label,
    this.ratio = 1.0,
    this.keyboard,
    this.inputFormatter,
  });

  final String label;
  final double ratio;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * ratio,
            child: TextFormField(
              keyboardType: keyboard,
              inputFormatters: inputFormatter,
              style: const TextStyle(fontSize: 28),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '$labelを入力してください';
                } else if (!RegExp(r'^[ぁ-んー]+$').hasMatch(value!)) {
                  return 'ひらがなのみを入力してください';
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
