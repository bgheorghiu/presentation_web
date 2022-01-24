import 'package:flutter/material.dart';

class WebTheme {
  static const Color mainColor = Color(0XFFCCD8D2);
  static const Color backgroundColor = Color(0XFF000D0C);
  static const Color lightColor = Color(0XFF6BAA8C);
  static const Color nameColor = Color(0XFFD9EBE2);
  static const Color subNameColor = Color(0XFFDFF2DF);


  static const TextStyle tabText = TextStyle(
    color: WebTheme.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    letterSpacing: 5,
  );

 static const TextStyle aboutText = TextStyle(
    color: WebTheme.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    letterSpacing: 3,
  );

  static const TextStyle nameText = TextStyle(
    color: WebTheme.mainColor,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    letterSpacing: 4,
  );

  static const TextStyle subtitle = TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
    letterSpacing: 5,
  );

  static ButtonStyle outlinedStyle = OutlinedButton.styleFrom(
    primary: WebTheme.lightColor,
    side: const BorderSide(
      color: WebTheme.lightColor,
    ),
  );
}
