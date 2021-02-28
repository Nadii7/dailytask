import 'package:dailytask/src/core/constants.dart';
import 'package:dailytask/src/core/dummy_data.dart';
import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {
  final Function(String) onSelect;
  const DayWidget({
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  _DayWidgetState createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: white,
      margin: EdgeInsets.only(top: 10),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
        ),
        hint: Text("Day"),
        // onTap: widget.isEnabled==false?(){}:,
        onChanged: (value) {
          setState(() {
            title = value;
            widget.onSelect(value);
          });
        },
        items: [
          for (int i = 0; i < DummyData.dayList.length; i++)
            DropdownMenuItem<String>(
              value: DummyData.dayList[i],
              child: Text(
                DummyData.dayList[i],
                style: TextStyle(color: kPrimaryColor),
              ),
            )
        ],
      ),
    );
  }
}
