import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:score_board/Cubit/textfield_states.dart';

class TextfieldCubit extends Cubit<TextfieldStates> {
  TextfieldCubit() : super(InitialTextfieldState()) {
    initPlayers(2);
  }
  List<Map<String, TextEditingController>> players = [];
  List<FocusNode> nameFocusNodes = [];
  List<FocusNode> scoreFocusNodes = [];
  int playerCount = 2;
  int roundCount = 1;

  void initPlayers(int count) {
    players = List.generate(count, (_) {
      return {
        'name': TextEditingController(),
        'score': TextEditingController(),
        'total': TextEditingController(text: "0"),
      };
    });
    nameFocusNodes = List.generate(count, (_) => FocusNode());
    scoreFocusNodes = List.generate(count, (_) => FocusNode());
    emit(InitialTextfieldState());
  }

  void addPlayer() {
    players.add({
      'name': TextEditingController(),
      'score': TextEditingController(),
      'total': TextEditingController(), // Initialize total score
    });
    playerCount++; // Increment the player count
    nameFocusNodes.add(FocusNode());
    scoreFocusNodes.add(FocusNode());
    print("playerCount: $playerCount");
    emit(AddTextField());
  }

  void removePlayer(int index, BuildContext context) {
    if (players.length > 2) {
      players[index]['name']?.dispose();
      players[index]['score']?.dispose();
      players[index]['total']?.dispose();
      nameFocusNodes[index].dispose();
      scoreFocusNodes[index].dispose();
      players.removeAt(index);
      nameFocusNodes.removeAt(index);
      scoreFocusNodes.removeAt(index);
      playerCount--;
      emit(RemoveTextField());
      emit(RemoveTextField());
    } else {
      players[index]['name']?.text = '';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 1000),
          content: Text(
            "Two fields at least are required",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void startGame(BuildContext context) {
    unfocusAll(context);
    for (int i = 0; i < players.length; i++) {
      if (players[i]['name']?.text.isEmpty ?? true) {
        players[i]['name']?.text = "Player ${i + 1}";
      }
      players[i]['score']?.text = "";
      players[i]['total']?.text = "0";
      roundCount = 1; // Reset round count
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text(
          "Let's Goooooooooooooooooooo",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
    );
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(context, 'score');
    });
    emit(StartGame());
  }

  void resetScores(BuildContext context) {
    unfocusAll(context);
    for (var player in players) {
      player['score']?.text = ""; // Reset score to 0
      player['total']?.text = ""; // Reset total score to 0
    }
    roundCount = 1; // Reset round count
    emit(ResetScores());
  }

  void newRound(BuildContext context) {
    unfocusAll(context);
    for (var player in players) {
      final currentScore = int.tryParse(player['score']?.text ?? "0") ?? 0;
      final total = int.tryParse(player['total']?.text ?? "0") ?? 0;
      player['total']?.text =
          (total + currentScore).toString(); // Update total score
    }
    for (var player in players) {
      player['score']?.text = ""; // Clear the score for the new round
    }
    roundCount++;
    emit(NewRound());
  }

  void homeButton(BuildContext context) {
    unfocusAll(context);
    for (var player in players) {
      player['name']?.dispose(); // Dispose of the controllers
      player['score']?.dispose();
      player['total']?.dispose();
    }
    initPlayers(2);
    roundCount = 1; // Reset round count
    Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    emit(HomeButton());
  }

  void finalScore(BuildContext context) {
    unfocusAll(context);
    for (var player in players) {
      final currentScore = int.tryParse(player['score']?.text ?? "0") ?? 0;
      final total = int.tryParse(player['total']?.text ?? "0") ?? 0;
      player['total']?.text =
          (total + currentScore).toString(); // Update total score
    }
    for (var player in players) {
      player['score']?.text = ""; // Clear the score for the new round
    }

    Navigator.pushNamed(context, 'final');
    emit(FinalScore());
  }

  void unfocusAll(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
