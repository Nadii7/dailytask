import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  final Function(int) getSelected;

  const RadioWidget({Key key, this.getSelected}) : super(key: key);
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int _radioValue = 1;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      widget.getSelected(_radioValue);
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              value: 0,
              groupValue: _radioValue,
              dense: true,
              padding: EdgeInsets.zero,
              title: Text("24 hour /day"),
              onChanged: _handleRadioValueChange,
            ),
          ),
          Expanded(
            child: RadioListTile(
              value: 1,
              groupValue: _radioValue,
              dense: true,
              title: Text("set date & time"),
              padding: EdgeInsets.zero,
              onChanged: _handleRadioValueChange,
            ),
          ),
        ],
      ),
    );
  }
}
