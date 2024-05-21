import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:flutter_picker/flutter_picker.dart';

import 'package:flutter_datetime_picker_plus/src/datetime_picker_theme.dart' as picker_theme;

import 'package:pluto_grid_test/_component/text_form.dart';

import '../_component/common_button.dart';
import '../_component/app_form_card.dart';

typedef Fn = Function({required DateTime date});

enum RadioValue { yes, no }

RadioValue? selectedValue = RadioValue.yes;

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({required DateTime currentTime, required LocaleType locale}) : super(locale: locale) {
    this.currentTime = currentTime;
    setLeftIndex(this.currentTime.year);
    setMiddleIndex(0);
    setRightIndex(0);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 1900 && index <= currentTime.year) {
      return index.toString();
    } else {
      return null;
    }
  }

  @override
  List<int> layoutProportions() {
    return [1, 0, 0];
  }

  @override
  DateTime finalTime() {
    return DateTime(currentLeftIndex(), 1, 1);
  }

  int getMaxValue(int col) {
    return 2024;
  }

  int getMinValue(int col) {
    return 1900;
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int? selectedYear;
  String _selectedDate = '日付を選択';

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          _selectedDate = "${date.year}年${date.month}月${date.day}日";
        });
      },
      theme: const picker_theme.DatePickerTheme(
        itemStyle: TextStyle(fontSize: 36),
        itemHeight: 56,
        containerHeight: 300,
        titleHeight: 60,
        cancelStyle: TextStyle(fontSize: 26, color: Color(0xFF841238), fontWeight: FontWeight.bold),
        doneStyle: TextStyle(fontSize: 26, color: Color(0xFF841238), fontWeight: FontWeight.bold),
      ),
      currentTime: DateTime.now(),
      locale: LocaleType.jp,
    );
  }

  void _showYearPicker() {
    DatePicker.showPicker(
      context,
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          selectedYear = date.year;
        });
      },
      pickerModel: CustomPicker(currentTime: DateTime.now(), locale: LocaleType.jp),
      theme: const picker_theme.DatePickerTheme(
        itemStyle: TextStyle(fontSize: 36),
        itemHeight: 56,
        containerHeight: 300,
        titleHeight: 60,
        cancelStyle: TextStyle(fontSize: 26, color: Color(0xFF841238), fontWeight: FontWeight.bold),
        doneStyle: TextStyle(fontSize: 26, color: Color(0xFF841238), fontWeight: FontWeight.bold),
      ),
      locale: LocaleType.jp,
    );
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppFormCard(
              title: '氏名',
              children: [
                TextForm.full(label: '姓'),
                TextForm.full(label: '名'),
              ],
            ),
            const AppFormCard(
              title: 'カナ氏名',
              children: [
                Column(
                  children: [
                    TextForm.full(label: 'セイ'),
                    SizedBox(height: 15),
                    TextForm.full(label: 'メイ'),
                  ],
                ),
              ],
            ),
            const AppFormCard(
              title: '体型',
              children: [
                TextForm.full(label: '身長(cm)'),
                SizedBox(height: 15),
                TextForm.full(label: '体重(kg)'),
                SizedBox(height: 15),
                TextForm.full(label: '肩の高さ(cm)'),
              ],
            ),
            // todo 年齢・参加歴
            AppFormCard(
              title: '年齢・参加歴',
              children: [
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '生年月日',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 5),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF841238),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: const Size(double.maxFinite, 70),
                      ),
                      onPressed: _showDatePicker,
                      child: Text(
                        _selectedDate,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '参加年',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(height: 5),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF841238),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: const Size(double.maxFinite, 70),
                      ),
                      onPressed: _showYearPicker,
                      child: Text(
                        selectedYear != null ? '$selectedYear年' : '年を選択',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const AppFormCard(
              title: '紹介者氏名',
              children: [
                Column(
                  children: [
                    TextForm.full(label: '姓'),
                    SizedBox(height: 15),
                    TextForm.full(label: '名'),
                  ],
                ),
              ],
            ),
            const AppFormCard(
              title: '紹介者カナ氏名',
              children: [
                Column(
                  children: [
                    TextForm.full(label: 'セイ'),
                    SizedBox(height: 15),
                    TextForm.full(label: 'メイ'),
                  ],
                ),
              ],
            ),
            AppFormCard(
              title: 'お子様は参加されますか？',
              children: [
                Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'はい',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      leading: Radio(
                        activeColor: const Color(0xFFa61746),
                        value: RadioValue.yes,
                        groupValue: selectedValue,
                        onChanged: (val) {
                          selectedValue = val;
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'いいえ',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      leading: Radio(
                        activeColor: const Color(0xFFa61746),
                        value: RadioValue.no,
                        groupValue: selectedValue,
                        onChanged: (val) {
                          selectedValue = val;
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            AppFormCard(
              title: 'お子様は小学生以下ですか？',
              children: [
                Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'はい',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      leading: Radio(
                        activeColor: const Color(0xFFa61746),
                        value: RadioValue.yes,
                        groupValue: selectedValue,
                        onChanged: (val) {
                          selectedValue = val;
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'いいえ',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      leading: Radio(
                        activeColor: const Color(0xFFa61746),
                        value: RadioValue.no,
                        groupValue: selectedValue,
                        onChanged: (val) {
                          selectedValue = val;
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            const AppFormCard(
              title: 'お子様の学年',
              children: [],
            ),
            const AppFormCard(
              title: 'お子様氏名',
              children: [
                Column(
                  children: [
                    TextForm.full(label: '姓'),
                    SizedBox(height: 15),
                    TextForm.full(label: '名'),
                  ],
                ),
              ],
            ),
            const AppFormCard.last(
              title: 'お子様カナ氏名',
              children: [
                Column(
                  children: [
                    TextForm.full(label: 'セイ'),
                    SizedBox(height: 15),
                    TextForm.full(label: 'メイ'),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CommonButton(
                text: '登録',
                onPressed: () {
                  Navigator.pushNamed(context, '/signup_complete');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
