import 'package:flutter/material.dart';
import 'package:score_board/FinalScreen/final_score_screen.dart';
import 'package:score_board/HomeScreen/home_screen.dart';
import 'package:score_board/ScoreScreen/score_screen.dart';
import 'package:score_board/custom_route.dart';
import 'package:score_board/ErrorPage/error_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return SlidePageRoute(route: HomePage());

      case 'score':
        return SlidePageRoute(route: const ScorePage());

      case 'final':
        return SlidePageRoute(route: const FinalScoreScreen());
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
