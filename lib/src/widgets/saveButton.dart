import 'package:dailytask/src/core/constants.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function onPress;

  const SaveButton({Key key, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: FlatButton(
        height: 45,
        textColor: white,
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "Save Settings",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        onPressed: onPress,
      ),
    );
  }
}
