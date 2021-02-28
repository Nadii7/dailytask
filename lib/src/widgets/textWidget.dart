import 'package:dailytask/src/core/constants.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double width;
  final int length;
  final Function(String) getValue;

  const TextWidget(
      {Key key,
      @required this.title,
      this.getValue,
      @required this.width,
      @required this.length})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
        border: Border.all(
          color: kBorderColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Spacer(),
          Flexible(
            flex: 3,
            child: TextField(
              maxLength: length,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13,
                ),
              ),
              onChanged: (value) => getValue(value),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: kTextLightColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
