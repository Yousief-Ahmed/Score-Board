import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static const double wideButtonDivisor = 2.2;
  static const double narrowButtonDivisor = 2.4;
  static const String appName = "Score board";
  static const String playerNameLabel = "Enter Player Name";
  static const String startGameButton = "Start Game";
  static const String resetButton = "Reset";
  static const String scoreLabel = "Score : ";
  static const splashImage = 'assets/images/splash_screen_logo.png';
  static Color backgroundColor = const Color(
    0xFF_240E52,
  ); // لون الخلفية العامة للتطبيق
  static final homeTextStyle = TextStyle(
    color: textColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  static final scoreTextStyle = TextStyle(
    color: textColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static Color textColor = const Color(0xFF_F7D23A); // لون النص للتطبيق
  static Color buttonColor = const Color(0xFF_EB4F83); // لون الأزرار
  static Color secondColor = const Color(0xFF_5A2582); // لون العناوين للتطبيق
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final crownStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp);
final notCrownStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 14.sp,
);
