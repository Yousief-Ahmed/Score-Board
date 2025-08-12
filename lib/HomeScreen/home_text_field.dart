import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:score_board/Cubit/textfield_cubit.dart';

import 'package:score_board/constants.dart';

class HomeTextField extends StatelessWidget {
  final int? playerCounter;
  final int index; // Nullable to allow for dynamic addition/removal

  const HomeTextField({super.key, this.playerCounter, required this.index});
  @override
  Widget build(BuildContext context) {
    final playerCubit = BlocProvider.of<TextfieldCubit>(context);
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: TextField(
        focusNode: playerCubit.focusNodes[index],
        controller: playerCubit.players[index]['name'],
        textInputAction:
            index == playerCubit.players.length - 1
                ? TextInputAction.done
                : TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Player $playerCounter',
          labelStyle: TextStyle(
            color: Constants.textColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  playerCubit.removePlayer(index, context);
                  if (playerCubit.players.length == 1) {
                    playerCubit.players[0]['name']?.text = '';
                  }
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () {
                  playerCubit.addPlayer();
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          border: OutlineInputBorder(),
        ),
        cursorColor: Constants.textColor,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Constants.textColor,
          fontSize: 15.sp,
          fontWeight: FontWeight.w300,
        ),
        onChanged: (value) {},
        onSubmitted: (_) {
          if (index < playerCubit.players.length - 1) {
            FocusScope.of(
              context,
            ).requestFocus(playerCubit.focusNodes[index + 1]);
          } else {
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }
}
