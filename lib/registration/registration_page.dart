import 'package:flutter/material.dart';
import 'package:pluto_grid_test/_component/common_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '出席登録',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF841238),
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
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('出席登録用QRコードを読み取ってください',
            style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            const SizedBox(height: 20),
            CommonButton(
                text: 'mock',
                onPressed: () {
                  Navigator.pushNamed(context, '/registration_complete');
                },
            )
          ],
        ),
      ),
    );
  }
}
