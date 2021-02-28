import 'package:dailytask/src/core/constants.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final Function onPress;
  final String title;

  const HomeButton({Key key, @required this.onPress, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: kBorderColor),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: kSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPressed: onPress,
    );
  }
}
