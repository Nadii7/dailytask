import 'package:dailytask/src/core/constants.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function onPress;

  const AddButton({Key key, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      margin: EdgeInsets.only(left: 15, bottom: 10, top: 5),
      child: FlatButton(
        height: 35,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.5),
        ),
        color: kPrimaryColor,
        child: Icon(
          Icons.add,
          color: white,
        ),
        onPressed: onPress,
      ),
    );
  }
}
