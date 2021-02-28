import 'package:dailytask/src/core/constants.dart';
import 'package:dailytask/src/core/dummy_data.dart';
import 'package:dailytask/src/widgets/expansionWidget.dart';
import 'package:flutter/material.dart';

class FirstForm extends StatelessWidget {
  final String model;

  const FirstForm({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < DummyData.settingsList.length; i++)
          Column(
            children: [
              ExpansionWidget(
                title: DummyData.settingsList[i],
              ),
              Divider(
                color: kBorderColor,
                height: 0.0,
              ),
            ],
          ),
      ],
    );
  }
}
