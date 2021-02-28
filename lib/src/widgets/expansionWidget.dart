import 'package:dailytask/src/core/constants.dart';
import 'package:dailytask/src/widgets/saveButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'activationWidget.dart';
import 'textWidget.dart';
import 'workingTimeWidget.dart';

class ExpansionWidget extends StatelessWidget {
  final String title;

  const ExpansionWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      initiallyExpanded: true,
      backgroundColor: kPrimaryLightColor,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                // Activation Tile
                ActivationWidget(
                  onChanged: (value) => print(value),
                ),
                Divider(
                  color: kBorderColor,
                  height: 0.0,
                ),
                // Price Tile
                ListTile(
                  tileColor: white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  title: Text("Pricing"),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("add price"),
                      TextWidget(
                        width: 100,
                        length: 4,
                        title: "EGP",
                        getValue: (value) => print(value),
                      ),
                    ],
                  ),
                ),
                // Available widget
                WorkingTimeWidget(
                  title: "Available",
                  daysList: (value) => print(value),
                  dStartList: (value) => print(value),
                  dEndList: (value) => print(value),
                  nStartList: (value) => print(value),
                  nEndList: (value) => print(value),
                ),
              ],
            ),
            SaveButton(
              onPress: () {},
            )
          ],
        ),
      ],
    );
  }
}
