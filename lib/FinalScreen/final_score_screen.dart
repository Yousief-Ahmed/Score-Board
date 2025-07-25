import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/FinalScreen/final_score_screen_builder.dart';
import 'package:skrew/constants.dart';

class FinalScoreScreen extends StatelessWidget {
  const FinalScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playersCubit = BlocProvider.of<TextfieldCubit>(context);
    final int itemcount = playersCubit.players.length;
    return ScreenUtilInit(
      child: Scaffold(
        appBar: AppBar(title: const Text("🏆 Final Scores")),
        body: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: itemcount + 1,
          itemBuilder: (context, index) {
            return FinalScoreScreenBuilder(index: index);
          },
        ),
      ),
    );
  }
}
