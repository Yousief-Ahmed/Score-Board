import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData myTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: constants.secondColor, // لون شريط العنوان
    titleTextStyle: TextStyle(
      color: Color(0xFF_F7D23A), // لون النص في شريط العنوان
      fontSize: 20, // حجم الخط في شريط العنوان
    ),
  ),
  scaffoldBackgroundColor: constants.backgroundColor, // الخلفية العامة
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: constants.textColor, // لون الأيقونات
      iconSize: 30, // حجم الأيقونات
    ),
  ),
);
