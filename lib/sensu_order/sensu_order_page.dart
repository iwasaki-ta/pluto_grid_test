import 'package:flutter/material.dart';
import 'package:pluto_grid_test/_component/form_card.dart';
import 'package:pluto_grid_test/home/home_page.dart';

import '../_component/common_button.dart';

class SensuOrderPage extends StatelessWidget {
  const SensuOrderPage({super.key});

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
          '扇子申し込み',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF841238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '申し込み本数',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '本',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CommonButton(
              text: '申し込み',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('申し込み確認'),
                      content: const Text(
                        '扇子を本申し込みます。よろしいですか？',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'いいえ',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('申し込み完了'),
                                  content: const Text(
                                    '扇子を本申し込みました。',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Navigator.of(context).popUntil(ModalRoute.withName('/login/home'));
                                        Navigator.popUntil(context, (Route<dynamic> route) => route.settings.name == '/home');
                                      },
                                      child: const Text(
                                        'ホーム画面へ',
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            'はい',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            FormCard(
              title: 'kataoka',
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '本',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Text('kataoka111'),
                Text('kataoka222'),
                Text('kataoka157'),
                Text('kataoka122'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
