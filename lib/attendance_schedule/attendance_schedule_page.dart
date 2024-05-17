import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final int index;
  final bool isCircleSelected;
  final bool isCrossSelected;
  final VoidCallback onCircleTap;
  final VoidCallback onCrossTap;

  EventItem({
    required this.index,
    required this.isCircleSelected,
    required this.isCrossSelected,
    required this.onCircleTap,
    required this.onCrossTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 3,
            child: Text(
              '〇月〇日(〇)',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Expanded(
            flex: 5,
            child: Text(
              'イベント名',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onCircleTap,
              child: Text('〇',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: isCircleSelected ? const Color(0xFFa61746) : Colors.grey,
                ),
              ),
              /*Icon(
                Icons.radio_button_unchecked,
                color: isCircleSelected ? const Color(0xFFa61746) : Colors.grey,
                size: 35,
              ),*/
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: onCrossTap,
              child: Text('✕',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: isCrossSelected ? const Color(0xFFa61746) : Colors.grey,
                ),
              ),
              /*Icon(
                Icons.clear_rounded,
                color: isCrossSelected ? const Color(0xFFa61746) : Colors.grey,
                size: 40,
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceSchedulePage extends StatefulWidget {
  const AttendanceSchedulePage({super.key});

  @override
  _AttendanceSchedulePageState createState() => _AttendanceSchedulePageState();
}

class _AttendanceSchedulePageState extends State<AttendanceSchedulePage> {
  List<bool> selectedCircle = List<bool>.generate(15, (index) => false);
  List<bool> selectedCross = List<bool>.generate(15, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'イベント参加登録',
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('登録完了'),
                      content: const Text(
                        'イベント参加予定を登録しました。',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFF841238)
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                '更新',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) => const Divider(color: Colors.grey),
        itemBuilder: (context, index) {
          return EventItem(
            index: index,
            isCircleSelected: selectedCircle[index],
            isCrossSelected: selectedCross[index],
            onCircleTap: () {
              setState(
                () {
                  selectedCircle[index] = !selectedCircle[index];
                  selectedCross[index] = false;
                },
              );
            },
            onCrossTap: () {
              setState(
                () {
                  selectedCross[index] = !selectedCross[index];
                  selectedCircle[index] = false;
                },
              );
            },
          );
        },
      ),
    );
  }
}
