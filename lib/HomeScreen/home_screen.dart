import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/Cubit/textfield_states.dart';
import 'package:skrew/HomeScreen/home_screen_builder.dart';
import 'package:skrew/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final playercubit = BlocProvider.of<TextfieldCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Text(Constants.appName)),
      body: ScreenUtilInit(
        builder:
            (context, child) => Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.h,
                children: [
                  Text(
                    Constants.playerNameLabel,
                    style: Constants.homeTextStyle,
                  ),
                  BlocBuilder<TextfieldCubit, TextfieldStates>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: playercubit.players.length + 1,
                          itemBuilder: (context, index) {
                            return HomeScreenBuilder(index: index);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
