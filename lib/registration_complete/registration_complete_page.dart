import 'package:flutter/material.dart';
import 'package:pluto_grid_test/_component/common_button.dart';

class RegistrationCompletePage extends StatelessWidget {
  const RegistrationCompletePage({super.key});

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
            '出席登録',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF841238),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text('出席登録が完了しました。本日もよろしくお願いします。',
              style: TextStyle(
                fontSize: 30,
              ),
              ),
              const SizedBox(height: 20),
              CommonButton(
                text: 'ホーム画面へ',
                onPressed: () {
                  Navigator.popUntil(context, (Route<dynamic> route) => route.settings.name == '/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
