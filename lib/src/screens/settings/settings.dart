import 'package:flutter/material.dart';

import 'components/body.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Body(),
    );
  }
}
//  Container(
//           child: Text(ModalRoute.of(context).settings.arguments),
//         ),