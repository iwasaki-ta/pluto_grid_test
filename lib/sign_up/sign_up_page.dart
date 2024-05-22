import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:flutter_datetime_picker_plus/src/datetime_picker_theme.dart' as picker_theme;

import 'package:pluto_grid_test/_component/text_form.dart';

import '../_component/common_button.dart';
import '../_component/app_form_card.dart';

typedef Fn = Function({required DateTime date});

enum RadioValue { yes, no }

RadioValue? selectedParticipation = RadioValue.no;
RadioValue? selectedUnderElementary = RadioValue.no;

class YearPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  YearPicker({required DateTime currentTime, required LocaleType locale}) : super(locale: locale) {
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
}

class GradePicker extends CommonPickerModel {
  GradePicker({required DateTime currentTime, required LocaleType locale}) : super(locale: locale) {
    this.currentTime = currentTime;
    setLeftIndex(0);
    setMiddleIndex(0);
    setRightIndex(0);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 1 && index <= 6) {
      return '小$index';
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
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int? selectedYear;
  String _selectedDate = '日付を選択';
  int? selectedGrade;

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
      pickerModel: YearPicker(currentTime: DateTime.now(), locale: LocaleType.jp),
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

  void _showGradePicker() {
    DatePicker.showPicker(
      context,
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          selectedGrade = date.year; // 小学の学年は month に格納される
        });
      },
      pickerModel: GradePicker(currentTime: DateTime.now(), locale: LocaleType.jp),
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
    final formKey = GlobalKey<FormState>();
    final _controller = ScrollController();

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
        controller: _controller,
        child: Form(
          key: formKey,
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
                title: 'かな氏名',
                children: [
                  Column(
                    children: [
                      KanaTextForm.full(
                        label: '姓',
                        inputFormatter: [
                          // FilteringTextInputFormatter.allow(RegExp(r'^[ァ-ンヴー]+$')),
                          // FilteringTextInputFormatter.allow(RegExp(r'^[ぁ-んー]+$')),
                        ],
                      ),
                      SizedBox(height: 15),
                      KanaTextForm.full(label: '名'),
                    ],
                  ),
                ],
              ),
              AppFormCard(
                title: '体型',
                children: [
                  TextForm.full(
                    label: '身長(cm)',
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    keyboard: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  TextForm.full(
                    label: '体重(kg)',
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    keyboard: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  TextForm.full(
                    label: '肩の高さ(cm)',
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    keyboard: TextInputType.number,
                  ),
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
                title: '紹介者かな氏名',
                children: [
                  Column(
                    children: [
                      KanaTextForm.full(label: '姓'),
                      SizedBox(height: 15),
                      KanaTextForm.full(label: '名'),
                    ],
                  ),
                ],
              ),
              AppFormCard(
                title: 'お子様は参加されますか？',
                bottomPadding: selectedParticipation == RadioValue.no ? 20 : 0,
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
                          groupValue: selectedParticipation,
                          onChanged: (val) {
                            setState(
                              () {
                                selectedParticipation = val;
                              },
                            );
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
                          groupValue: selectedParticipation,
                          onChanged: (val) {
                            setState(
                              () {
                                selectedParticipation = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Visibility(
                visible: selectedParticipation == RadioValue.yes,
                child: Column(
                  children: [
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
                                groupValue: selectedUnderElementary,
                                onChanged: (val) {
                                  setState(() {
                                    selectedUnderElementary = val;
                                  });
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
                                groupValue: selectedUnderElementary,
                                onChanged: (val) {
                                  setState(
                                    () {
                                      selectedUnderElementary = val;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Visibility(
                      visible: selectedUnderElementary == RadioValue.yes,
                      child: AppFormCard(
                        title: 'お子様の学年',
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF841238),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              fixedSize: const Size(double.maxFinite, 70),
                            ),
                            onPressed: _showGradePicker,
                            child: Text(
                              selectedGrade != null ? '小$selectedGrade' : '学年を選択',
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      title: 'お子様かな氏名',
                      children: [
                        Column(
                          children: [
                            KanaTextForm.full(label: '姓'),
                            SizedBox(height: 15),
                            KanaTextForm.full(label: '名'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: CommonButton(
                  text: '登録',
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      _controller.animateTo(
                        _controller.position.minScrollExtent,
                        duration: const Duration(seconds: 1),
                        curve: Curves.bounceIn,
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('エラー'),
                            content: const Text(
                              '未入力または条件を満たしていない項目があります。',
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
                                  'OK',
                                  style: TextStyle(fontSize: 30, color: Color(0xFF841238)),
                                ),
                              )
                            ],
                          );
                        },
                      );
                      return;
                    }

                    // フォーカスを外す
                    FocusScope.of(context).unfocus();

                    //Navigator.pushNamed(context, '/signup_complete');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
