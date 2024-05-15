
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_grid_test/attendance_schedule/attendance_schedule_page.dart';
import 'package:pluto_grid_test/participants_list_data.dart';
import 'package:pluto_grid_test/registration/registration_page.dart';
import 'package:pluto_grid_test/registration_complete/registration_complete_page.dart';
import 'package:pluto_grid_test/sign_up/sign_up_page.dart';
import 'package:pluto_grid_test/login/login_page.dart';
import 'package:pluto_grid_test/participants_list/participants_list_page.dart';
import 'package:pluto_grid_test/pluto_grid_wrapper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pluto_grid_test/sensu_order/sensu_order_page.dart';
import 'package:pluto_grid_test/sign_up_complete/sign_up_complete_page.dart';
import 'package:pluto_grid_test/splash_screen/splash_screen.dart';

import 'home/home_page.dart';

// 列の定義
List<PlutoColumn> columns = [
      PlutoColumn(
          title: '参加者',
          field: 'name',
          type: PlutoColumnType.text(),
          width: 190,
          frozen: PlutoColumnFrozen.start,
          backgroundColor: Colors.black.withOpacity(0.05)),
    ] +
    List.generate(
      16,
      (index) => PlutoColumn(
          title: '${index + 1}(${["土", "日", "月", "火", "水", "木", "金"][(index + 1) % 7]})',
          field: '${index + 1}',
          type: PlutoColumnType.text(),
          width: 100,
          textAlign: PlutoColumnTextAlign.center,
          titleTextAlign: PlutoColumnTextAlign.center,
          backgroundColor: Colors.black.withOpacity(0.05)),
    );

PlutoGridWrapper wrapper = PlutoGridWrapper();
List<PlutoColumn> wrappedColumns = wrapper.wrap(columns);

// 行の定義


class MyDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: wrappedColumns,
      rows: rows,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        // 必要に応じてグリッドをロードした後の処理を記述
        debugPrint("Grid Loaded");
      },
      onChanged: (PlutoGridOnChangedEvent event) {
        // データが変更されたときの処理
        debugPrint("Cell changed: ${event.rowIdx}, ${event.column.field}, ${event.value}");
      },
      configuration: const PlutoGridConfiguration(
          style: PlutoGridStyleConfig(
        cellTextStyle: TextStyle(fontSize: 30),
        columnTextStyle: TextStyle(fontSize: 30),
        columnHeight: 150,
        rowHeight: 100,
      )),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/signup_complete': (context) => const SignUpCompletePage(),
        '/home': (context) => HomePage(),
        '/registration': (context) => const RegistrationPage(),
        '/attendance_schedule': (context) => AttendanceSchedulePage(),
        '/registration_complete': (context) => const RegistrationCompletePage(),
        '/sensu': (context) => const SensuOrderPage(),
      },
    ),
  );
}
