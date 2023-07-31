import 'package:flutter/material.dart';

import 'Colors.dart';

// 앱바 테마 설정.

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: primaryBackground,
  titleTextStyle: TextStyle(
      fontFamily: 'SUITE',
      color: primaryText,
      fontSize: 22.0,
      fontWeight: FontWeight.w500),
  actionsIconTheme: IconThemeData(color: secondaryText),
  centerTitle: false,
  elevation: 2.0,
  shadowColor: Colors.black,
);
