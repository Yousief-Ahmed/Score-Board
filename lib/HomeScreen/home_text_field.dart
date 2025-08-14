import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/Cubit/textfield_cubit.dart';

import 'package:score_board/Core/custom_text_field.dart';

class HomeTextField extends StatelessWidget {
  final int? playerCounter;
  final int index; // Nullable to allow for dynamic addition/removal

  const HomeTextField({super.key, this.playerCounter, required this.index});
  @override
  Widget build(BuildContext context) {
    final playerCubit = BlocProvider.of<TextfieldCubit>(context);
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: CustomTextField(
        controller: playerCubit.players[index]['name']!,
        fieldType: FieldType.name,
        index: index,
        focusNodes: playerCubit.nameFocusNodes,
        onAdd: () {
          playerCubit.addPlayer();
        },
        onRemove: () {
          playerCubit.removePlayer(index, context);
          if (playerCubit.players.length == 1) {
            playerCubit.players[0]['name']?.text = '';
          }
        },
      ),
    );
  }
}
