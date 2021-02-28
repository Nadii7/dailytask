import 'package:dailytask/src/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final Function(bool) onChanged;
  final String title;

  const SwitchWidget({Key key, this.onChanged, this.title}) : super(key: key);
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isActivated = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: white,
      contentPadding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      title: Text(widget.title),
      trailing: CupertinoSwitch(
        value: isActivated,
        activeColor: kPrimaryColor,
        onChanged: (value) {
          setState(() {
            isActivated = value;
            widget.onChanged(value);
          });
        },
      ),
    );
  }
}
