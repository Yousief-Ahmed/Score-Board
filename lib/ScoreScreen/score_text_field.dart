import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/Cubit/textfield_cubit.dart';
import 'package:score_board/Cubit/textfield_states.dart';
import 'package:score_board/Core/custom_text_field.dart';

class ScoreTextfield extends StatelessWidget {
  const ScoreTextfield({super.key, required this.index});
  final int index; // Index of the player
  @override
  Widget build(BuildContext context) {
    final playerCubit = BlocProvider.of<TextfieldCubit>(context);
    final scoreController = playerCubit.players[index]['score'];
    final totalScoreController = playerCubit.players[index]["total"];

    return Padding(
      padding: EdgeInsets.all(6.0),
      child: BlocBuilder<TextfieldCubit, TextfieldStates>(
        builder: (context, state) {
          return CustomTextField(
            controller: scoreController!,
            focusNodes: playerCubit.scoreFocusNodes,
            fieldType: FieldType.score,
            index: index,
            hintText: totalScoreController?.text ?? "0",
          );
        },
      ),
    );
  }
}

