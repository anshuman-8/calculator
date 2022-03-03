import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue[200],
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.blue[750]),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
    padding:
        MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(5)),
    shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    //backgroundColor: MaterialStateProperty.all<Color>(Colors.light)
  )),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
