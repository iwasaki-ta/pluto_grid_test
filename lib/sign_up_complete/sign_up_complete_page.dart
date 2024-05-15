import 'package:flutter/material.dart';

import '../_component/common_button.dart';

class SignUpCompletePage extends StatelessWidget {
  const SignUpCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
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
              const Text(
                '仮登録が完了しました。\n本登録承認後、ログインが可能になります。',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              CommonButton(
                text: 'ログイン画面へ',
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
