import 'package:flutter/material.dart';
import 'package:pluto_grid_test/participants_list/participants_list_page.dart';
import 'package:intl/intl.dart';
import 'package:pluto_grid_test/registration/registration_page.dart';
import 'package:pluto_grid_test/sensu_order/sensu_order_page.dart';

import '../_component/big_button.dart';
import '../_component/common_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  get joinNum => null;

  get eventDay => null;

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = Localizations.localeOf(context).toString();
    return PopScope(
      //canPop: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'ホーム',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF841238),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  '本日の出席登録が未完了です',
                  style: TextStyle(fontSize: 35, color: Colors.red),
                ),
                Text(
                  '${DateFormat.MEd().format(DateTime.now())} $eventDay',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '本日の参加人数 $joinNum人',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                BigButton(
                  text: '出席登録',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationPage()));
                  },
                ),
                const SizedBox(height: 10),
                BigButton(
                  text: 'イベント参加登録',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/attendance_schedule');
                  },
                ),
                const SizedBox(height: 10),
                BigButton(
                  text: '参加者一覧',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParticipantsListPage()));
                  },
                ),
                const SizedBox(height: 10),
                BigButton(
                  text: '扇子申し込み',
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SensuOrderPage()));
                    Navigator.of(context).pushNamed('/sensu');
                  },
                ),
                const SizedBox(height: 10),
                BigButton(
                  text: '参加者承認',
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                BigButton(
                  text: 'イベント日登録',
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
