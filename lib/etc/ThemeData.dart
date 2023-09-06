import 'package:flutter/material.dart';
import 'package:save_children_v01/etc/Appbar.dart';

import 'Colors.dart';

// 테마 데이터
ThemeData themeData = ThemeData(
  appBarTheme: appBarTheme,
  scaffoldBackgroundColor: primaryBackground,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(primary),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      elevation: MaterialStateProperty.all<double>(2.0),
      shadowColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
  ),
);
