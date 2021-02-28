import 'package:dailytask/src/core/constants.dart';
import 'package:flutter/material.dart';

import 'timeButton.dart';

class TimeWidget extends StatelessWidget {
  final Function(TimeOfDay) startTime;
  final Function(TimeOfDay) endTime;

  final String title;
  const TimeWidget({
    Key key,
    @required this.title,
    this.startTime,
    this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: white,
      contentPadding: EdgeInsets.only(top: 5),
      title: Text(title),
      subtitle: Container(
        height: 45,
        margin: EdgeInsets.only(top: 5),
        child: Row(
          children: [
            TimeButton(
              title: "from",
              selectedTime: (value) => startTime(value),
            ),
            SizedBox(
              width: 10,
            ),
            TimeButton(
              title: "to",
              selectedTime: (value) => endTime(value),
            ),
          ],
        ),
      ),
    );
  }
}
