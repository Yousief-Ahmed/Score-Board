import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/FinalScreen/final_score_screen.dart';
import 'package:skrew/HomeScreen/home_page.dart';
import 'package:skrew/ScoreScreen/score_screen.dart';
import 'package:skrew/constants.dart';
import 'package:skrew/custom_route.dart';
import 'package:skrew/ErrorPage/error_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
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
