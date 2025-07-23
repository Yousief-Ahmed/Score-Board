import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/constants.dart';

class FinalScoreScreen extends StatelessWidget {
  const FinalScoreScreen({super.key});

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
    return ScreenUtilInit(
      child: Scaffold(
        appBar: AppBar(title: const Text("🏆 Final Scores")),
        body: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: sortedPlayers.length,
          itemBuilder: (context, index) {
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
          },
        ),
      ),
    );
  }
}

