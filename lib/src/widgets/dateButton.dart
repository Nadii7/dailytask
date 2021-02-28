import 'package:dailytask/src/core/constants.dart';
import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  final String title;
  final Function(DateTime) selectedData;

  const DateButton({
    Key key,
    this.title,
    this.selectedData,
  }) : super(key: key);

  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  String pickedDate, pickedTime, picked;

  Future<Null> selectTime(BuildContext context) async {
    _time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (_time != null)
      setState(() {
        pickedTime = "${_time.hour}:${_time.minute}";
        picked = "$pickedDate - $pickedTime";
      });
  }

  Future<Null> selectDate(BuildContext context) async {
    _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime.now(),
    );
    if (_date != null)
      setState(() {
        pickedDate = "${_date.year}-${_date.month}-${_date.day}";
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
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              picked ?? widget.title,
              style: TextStyle(
                fontSize: 14,
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
          selectDate(context).then((_) => selectTime(context)).then((_) =>
              widget.selectedData(DateTime(_date.year, _date.month, _date.day,
                  _time.hour, _time.minute, 00)));
        },
      ),
    );
  }
}
