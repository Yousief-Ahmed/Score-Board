import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:score_board/Cubit/textfield_cubit.dart';
import 'package:score_board/Cubit/textfield_states.dart';
import 'package:score_board/constants.dart';

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
          return TextField(
            focusNode: playerCubit.focusNodes[index],
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: scoreController,
            decoration: InputDecoration(
              hintText: totalScoreController?.text ?? "0",
              hintStyle: TextStyle(
                color: Constants.textColor.withOpacity(0.5),
                fontSize: 15.sp,
              ),
              border: OutlineInputBorder(),
            ),
            cursorColor: Constants.textColor,
            keyboardType: TextInputType.number,
            textInputAction:
                index == playerCubit.players.length - 1
                    ? TextInputAction.done
                    : TextInputAction.next,
            style: TextStyle(
              color: Constants.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
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
          );
        },
      ),
    );
  }
}
