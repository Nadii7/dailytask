import 'package:dailytask/src/core/constants.dart';
import 'package:flutter/material.dart';

class TimeButton extends StatefulWidget {
  final String title;
  final Function(TimeOfDay) selectedTime;

  const TimeButton({
    Key key,
    this.title,
    this.selectedTime,
  }) : super(key: key);

  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  TimeOfDay _time = TimeOfDay.now();
  String picked;

  Future<Null> selectTime(BuildContext context) async {
    _time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (_time != null)
      setState(() {
        picked = _time.format(context);
        widget.selectedTime(_time);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        height: 45,
        textColor: kTextLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: kBorderColor),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              picked ?? widget.title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            Icon(
              Icons.access_time,
              color: kTextLightColor,
            ),
          ],
        ),
        onPressed: () {
          selectTime(context);
        },
      ),
    );
  }
}
