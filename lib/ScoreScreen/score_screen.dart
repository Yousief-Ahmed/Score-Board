import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:score_board/Cubit/textfield_cubit.dart';
import 'package:score_board/Cubit/textfield_states.dart';
import 'package:score_board/ScoreScreen/score_screen_builder.dart';
import 'package:score_board/constants.dart';

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
                        style: Constants.scoreTextStyle,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: playersCubit.players.length + 1,
                          itemBuilder: (context, index) {
                            return ScoreScreenBuilder(index: index);
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
