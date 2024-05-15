import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_test/pluto_grid_wrapper.dart';

import '../main.dart';

class ParticipantsListPage extends StatelessWidget {
  const ParticipantsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
          labelColor: Colors.blue,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              '参加者一覧',
              style: TextStyle(color: Colors.white),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: SizedBox(
                  height: 70,
                  child: Material(
                    child: TabBar(
                      tabs: [
                        SizedBox(
                          height: 70,
                          child: Tab(
                            child: Text(
                              '大人',
                              style: TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          child: Tab(
                            child: Text(
                              '子ども',
                              style: TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                      ],

                      //アクティブタブのデザイン
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      //labelColor: Color(0xFF841238),
                      indicator: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Color(0xFF841238), width: 3),
                          )),
                    ),
                  )),
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
          body: TabBarView(physics: const NeverScrollableScrollPhysics(), children: <Widget>[
            Center(child: MyDataTable()),
            Center(child: MyDataTable()),
          ]),
        ),
      ),
    );
  }
}