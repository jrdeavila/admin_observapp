import 'package:flutter/material.dart';

abstract class ColorPalete {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFEEF1F8),
    inputDecorationTheme: inputDecorationTheme,
    primarySwatch: Colors.blue,
    fontFamily: "Intel",
  );

  // Configuracion de los inputs
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: defaultInputBorder,
    enabledBorder: defaultInputBorder,
    focusedBorder: defaultInputBorder,
    errorBorder: defaultInputBorder,
    filled: true,
    errorStyle: TextStyle(
      height: 0,
    ),
  );
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
