import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';

import 'package:skrew/HomeScreen/home_page.dart';
import 'package:skrew/myTheme.dart';
import 'package:skrew/routes.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextfieldCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        navigatorKey: navigatorKey,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
