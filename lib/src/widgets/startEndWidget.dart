import 'package:flutter/material.dart';

import 'dateButton.dart';

class StartEndWidget extends StatelessWidget {
  final Function(DateTime) startTime;
  final Function(DateTime) endTime;

  const StartEndWidget({Key key, this.startTime, this.endTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          DateButton(
            title: "start",
            selectedData: (value) => startTime(value),
          ),
          SizedBox(
            width: 10,
          ),
          DateButton(
            title: "end",
            selectedData: (value) => endTime(value),
          ),
        ],
      ),
    );
  }
}
