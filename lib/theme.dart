import 'package:flutter/material.dart';

class ArchTheme {
  static get theme {
    final originalTextTheme = ThemeData.light().textTheme;
    final originalBody1 = originalTextTheme.body1;

    return ThemeData(
      fontFamily: 'Roboto',
      canvasColor: Color(0xFFF4F6Fa),
      primaryColor: Color(0xFF3E4DBF),
      primaryColorDark: Color.fromRGBO(172, 182, 159, 1),
      primaryColorLight: Color(0xFF15B1FF),
      accentColor: Color(0xFF00BB58),
      buttonColor: Color(0xFF00C853),
      errorColor: Color(0xFFC82300),
//      highlightColor: Color.fromRGBO(240, 173, 78, 1),
      textSelectionColor: Color(0xFF65A0f1).withAlpha(60),
      textSelectionHandleColor: Color(0xFF65A0f1),
      backgroundColor: Color(0xFFEBF0F7),
      toggleableActiveColor: Color(0xFF463BB8),
      dividerColor: Color.fromRGBO(221, 221, 221, 1),
      hintColor: Color.fromRGBO(132, 132, 132, 1),
      primaryTextTheme: originalTextTheme.copyWith(
        display4: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        display3: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        display2: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        display1: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        headline: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        title: TextStyle(
          color: Color(0xFFFFFFFF),
        ),
        subhead: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        body2: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        body1: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        caption: TextStyle(
          color: Color(0xFF2C2C2C),
          fontFamily: 'Roboto-Condensed',
        ),
        button: TextStyle(
          color: Color(0xFF2C2C2C),
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto-Condensed',
        ),
        subtitle: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
        overline: TextStyle(
          color: Color(0xFF2C2C2C),
        ),
      ),
    );
  }
}

// static const DEFAULT_LIGHT = Color.fromRGBO(163, 200, 216, 1.0);
// static const DEFAULT_HEADER =  Color.fromRGBO(128, 128, 128, 1.0);
// static const DEFAULT = Color.fromRGBO(69, 147, 255, 1.0);
// static const SUCCESS=Color.fromRGBO(47, 181, 18, 1);
// static const DANGER=Color.fromRGBO(217, 83, 79, 1);
// static const WARNING=Color.fromRGBO(240, 173, 78, 1);
// static const PRIMARY=Color.fromRGBO(51, 121, 183, 1);
// static const SECONDARY=Color.fromRGBO(229, 57, 53, 1);
// static const INFO=Color.fromRGBO(90, 192, 222, 1);
