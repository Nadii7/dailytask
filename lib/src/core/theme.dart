import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    primaryColor: kPrimaryColor,
    accentColor: kPrimaryColor,
    dividerColor: kExpansionColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: GoogleFonts.poppins(color: kTextColor),
    bodyText2: GoogleFonts.poppins(color: Colors.black),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: kPrimaryColor,
    elevation: 0,
    brightness: Brightness.light,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
