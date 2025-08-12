import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/Cubit/textfield_cubit.dart';
import 'package:score_board/constants.dart';
import 'package:score_board/custom_button.dart';

class FinalScoreScreenBuilder extends StatelessWidget {
  final int index;
  const FinalScoreScreenBuilder({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final playersCubit = BlocProvider.of<TextfieldCubit>(context);
    final sortedPlayers = [...playersCubit.players]..sort((a, b) {
      final totalA = int.tryParse(a["total"]?.text ?? "0") ?? 0;
      final totalB = int.tryParse(b["total"]?.text ?? "0") ?? 0;
      return totalB.compareTo(totalA);
    });
    final topScore =
        sortedPlayers.isNotEmpty
            ? int.tryParse(sortedPlayers.first["total"]?.text ?? "0") ?? 0
            : 0;
    if (index < sortedPlayers.length) {
      final player = sortedPlayers[index];
      final name = player["name"]?.text ?? "Player ${index + 1}";
      final total = int.tryParse(player["total"]?.text ?? "0") ?? 0;
      final hasCrown = total == topScore;
      return ListTile(
        leading: Text(
          "#${index + 1}",
          style: hasCrown ? crownStyle : notCrownStyle,
        ),
        title: Text(
          hasCrown ? "👑 $name" : name,
          style: hasCrown ? crownStyle : notCrownStyle,
        ),
        trailing: Text(
          "Score: $total",
          style: hasCrown ? crownStyle : notCrownStyle,
        ),
        tileColor: hasCrown ? Colors.yellow.shade100 : null,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            text: "Home Page",
            onPressed: () => playersCubit.homeButton(context),
            color: Colors.blue,
          ),
        ],
      );
    }
  }
}
