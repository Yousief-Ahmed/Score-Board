import 'package:flutter/material.dart';
import 'package:skrew/FinalScreen/final_score_screen.dart';
import 'package:skrew/HomeScreen/home_screen.dart';
import 'package:skrew/ScoreScreen/score_screen.dart';
import 'package:skrew/custom_route.dart';
import 'package:skrew/ErrorPage/error_page.dart';


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
