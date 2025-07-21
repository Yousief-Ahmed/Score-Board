import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';

import 'package:skrew/constants.dart';

class HomeTextField extends StatelessWidget {
  final int? playerCounter;
  final int index; // Nullable to allow for dynamic addition/removal

  HomeTextField({Key? key, this.playerCounter, required this.index})
    : super(key: key);
  @override
  Widget build(BuildContext context) {
    final playersCubit = BlocProvider.of<TextfieldCubit>(context);
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: TextField(
        controller: playersCubit.players[index]['name'],
        decoration: InputDecoration(
          labelText: 'Player $playerCounter',
          labelStyle: TextStyle(
            color: constants.textColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  playersCubit.removePlayer(index);
                  if (playersCubit.players.length == 1) {
                    playersCubit.players[0]['name']?.text = '';
                  }
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () {
                  playersCubit.addPlayer();
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          border: OutlineInputBorder(),
        ),
        cursorColor: constants.textColor,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          color: constants.textColor,
          fontSize: 15.sp,
          fontWeight: FontWeight.w300,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
