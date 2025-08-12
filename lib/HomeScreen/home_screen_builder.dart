import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/Cubit/textfield_cubit.dart';
import 'package:score_board/HomeScreen/home_text_field.dart';
import 'package:score_board/HomeScreen/start_button.dart';

class HomeScreenBuilder extends StatelessWidget {
  final int index;
  const HomeScreenBuilder({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final playercubit = BlocProvider.of<TextfieldCubit>(context);
    if (index == playercubit.players.length) {
      return StartButton();
    } else {
      return HomeTextField(playerCounter: index + 1, index: index);
    }
  }
}
