import 'package:flutter/material.dart';
import 'src/core/theme.dart';
import 'src/screens/home/home.dart';
import 'src/screens/settings/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: "/home",
      routes: {
        "/settings": (context) => SettingsScreen(),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}
