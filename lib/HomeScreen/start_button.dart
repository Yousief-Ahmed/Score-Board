import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/ScoreScreen/score_screen.dart';
import 'package:skrew/constants.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final playerscubit = BlocProvider.of<TextfieldCubit>(context);
    return ScreenUtilInit(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: constants.buttonColor,
            ),
            onPressed: () {
              playerscubit.startGame(context);
            },
            child: Text(
              constants.startGameButton,
              style: TextStyle(color: constants.textColor, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}

