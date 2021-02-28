import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dailytask/src/core/constants.dart';

class ActivationWidget extends StatefulWidget {
  final Function(bool) onChanged;
  const ActivationWidget({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _ActivationWidgetState createState() => _ActivationWidgetState();
}

class _ActivationWidgetState extends State<ActivationWidget> {
  bool isActivated = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: white,
      contentPadding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      title: Text("Activation"),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(isActivated ? "on" : "off"),
          CupertinoSwitch(
            value: isActivated,
            activeColor: kPrimaryColor,
            onChanged: (value) {
              setState(() {
                isActivated = value;
                widget.onChanged(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
