import 'package:flutter/material.dart';

import 'firstForm.dart';
import 'secondForm.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String model = ModalRoute.of(context).settings.arguments;

    return SingleChildScrollView(
      child: model != "Doctor" && model != "Assistant"
          ? SecondForm(model: model)
          : FirstForm(model: model),
    );
  }
}
