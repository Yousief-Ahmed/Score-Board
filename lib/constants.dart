import 'package:flutter/cupertino.dart';

class constants {
  static const String appName = "Score board";
  static const String playerNameLabel = "Enter Player Name";
  static const String startGameButton = "Start Game";
  static const String resetButton = "Reset";
  static const String scoreLabel = "Score : ";
  static Color backgroundColor = const Color(
    0xFF_240E52,
  ); // لون الخلفية العامة للتطبيق
  static Color textColor = const Color(0xFF_F7D23A); // لون النص للتطبيق
  static Color buttonColor = const Color(0xFF_EB4F83); // لون الأزرار
  static Color secondColor = const Color(0xFF_5A2582); // لون العناوين للتطبيق
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

