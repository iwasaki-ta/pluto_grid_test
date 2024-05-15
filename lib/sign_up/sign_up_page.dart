import 'package:flutter/material.dart';

import '../_component/common_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0e0e0),
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            '戻る',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        title: const Text(
          '新規登録',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF841238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CommonButton(
              text: '登録',
              onPressed: () {
                Navigator.pushNamed(context, '/signup_complete');
              },
            ),
          ],
        ),
      ),
    );
  }
}