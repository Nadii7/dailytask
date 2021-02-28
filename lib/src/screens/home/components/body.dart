import 'package:dailytask/src/core/constants.dart';
import 'package:dailytask/src/core/dummy_data.dart';
import 'package:dailytask/src/widgets/homeButton.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Spacer(flex: 1),
        // Title
        Text(
          "You are a...",
          style: TextStyle(
            fontSize: 31,
            color: kSecondaryColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 25),
        // List of Users Type
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: DummyData.typeList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: HomeButton(
              title: DummyData.typeList[index],
              onPress: () {
                Navigator.pushNamed(
                  context,
                  "/settings",
                  arguments: DummyData.typeList[index],
                );
              },
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
        ),
        Spacer(flex: 3),
      ],
    );
  }
}
