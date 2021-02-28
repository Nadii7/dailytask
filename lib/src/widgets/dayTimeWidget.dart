import 'package:flutter/material.dart';

import 'dayWidget.dart';
import 'timeWidget.dart';

class DayTimeWidget extends StatelessWidget {
  final Function(String) dayData;
  final Function(TimeOfDay) dayStart, dayEnd, nightStart, nightEnd;

  const DayTimeWidget({
    Key key,
    this.dayData,
    this.dayStart,
    this.dayEnd,
    this.nightStart,
    this.nightEnd,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        DayWidget(
          onSelect: (value) => dayData(value),
        ),
        TimeWidget(
          title: "Day Shift",
          startTime: (value) => dayStart(value),
          endTime: (value) => dayEnd(value),
        ),
        TimeWidget(
          title: "Night Shift",
          startTime: (value) => nightStart(value),
          endTime: (value) => nightStart(value),
        ),
      ],
    );
  }
}
