import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/Cubit/textfield_states.dart';
import 'package:skrew/HomeScreen/start_button.dart';
import 'package:skrew/HomeScreen/home_text_field.dart';
import 'package:skrew/constants.dart';
import 'package:flutter_screenutil/src/screen_util.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final playercubit = BlocProvider.of<TextfieldCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Text(constants.appName)),
      body: ScreenUtilInit(
        builder:
            (context, child) => Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.h,
                children: [
                  Text(
                    constants.playerNameLabel,
                    style: TextStyle(
                      color: constants.textColor,
                      fontSize: 15.sp,
                    ),
                  ),
                  BlocBuilder<TextfieldCubit, TextfieldStates>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: playercubit.players.length + 1,
                          itemBuilder: (context, index) {
                            if (index == playercubit.players.length) {
                              return StartButton();
                            } else {
                              return HomeTextField(
                                playerCounter: index + 1,
                                index: index,
                              );
                            }
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
