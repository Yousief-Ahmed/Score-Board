import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/Cubit/textfield_states.dart';
import 'package:skrew/ScoreScreen/score_text_field.dart';
import 'package:skrew/constants.dart';
import 'package:skrew/custom_button.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final playersCubit = BlocProvider.of<TextfieldCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Score Screen")),
      body: BlocBuilder<TextfieldCubit, TextfieldStates>(
        builder: (context, state) {
          return ScreenUtilInit(
            builder:
                (context, child) => Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12.h,
                    children: [
                      Text(
                        "Round ${playersCubit.roundCount}",
                        style: TextStyle(
                          color: constants.textColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: playersCubit.players.length + 1,
                          itemBuilder: (context, index) {
                            final itemCount = playersCubit.players.length;
                            if (index < itemCount) {
                              final playerName =
                                  playersCubit.players[index]['name']?.text ??
                                  "";
                              return Padding(
                                padding: EdgeInsets.only(bottom: 5.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      playerName,
                                      style: TextStyle(
                                        color: constants.textColor,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ScoreTextfield(index: index),
                                  ],
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Wrap(
                                  spacing: 10.w,
                                  runSpacing: 5.h,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    CustomButton(
                                      text: "🔄 Reset Scores",
                                      onPressed:
                                          () => playersCubit.resetScores(),
                                      color: Colors.redAccent,
                                    ),
                                    CustomButton(
                                      text: "⏱ New Round",
                                      onPressed: () => playersCubit.newRound(),
                                      color: Colors.green,
                                    ),
                                    CustomButton(
                                      text: "📊 Final Scores",
                                      onPressed:
                                          () =>
                                              playersCubit.finalScore(context),
                                      color: Colors.amber,
                                    ),
                                    CustomButton(
                                      text: "🏠 Home",
                                      onPressed:
                                          () =>
                                              playersCubit.homeButton(context),
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
          );
        },
      ),
    );
  }
}
