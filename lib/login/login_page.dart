import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pluto_grid_test/_component/common_button.dart';
import 'package:pluto_grid_test/home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '西流綱場町 参加者管理アプリ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF841238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'ログイン',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'ログインID',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'パスワード',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CommonButton(
              text: 'ログイン',
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                Navigator.pushNamed(context, '/home');
              },
            ),
            const SizedBox(height: 70),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '参加者登録がまだの場合',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            CommonButton(
              text: '新規登録',
              onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
