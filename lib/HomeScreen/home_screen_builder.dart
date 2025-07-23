import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/HomeScreen/home_text_field.dart';
import 'package:skrew/HomeScreen/start_button.dart';

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
