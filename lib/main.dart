import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/Cubit/textfield_cubit.dart';
import 'package:score_board/myTheme.dart';
import 'package:score_board/routes.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextfieldCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        navigatorKey: navigatorKey,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: 'home',
      ),
    );
  }
}
