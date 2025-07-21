import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skrew/Cubit/textfield_cubit.dart';
import 'package:skrew/Cubit/textfield_states.dart';
import 'package:skrew/ScoreScreen/score_screen.dart';
import 'package:skrew/constants.dart';
import 'package:skrew/custom_route.dart';

class TextfieldCubit extends Cubit<TextfieldStates> {
  TextfieldCubit() : super(InitialTextfieldState()) {
    initPlayers(2);
  }
  List<Map<String, TextEditingController>> players = [];
  void initPlayers(int count) {
    players = List.generate(count, (_) {
      return {
        'name': TextEditingController(),
        'score': TextEditingController(),
        'total': TextEditingController(text: "0"), // Initialize total score
      };
    });
    emit(InitialTextfieldState());
  }

  int playerCount = 2; // Initialize with one player
  int roundCount = 1; // Initialize with one round

  void addPlayer() {
    players.add({
      'name': TextEditingController(),
      'score': TextEditingController(),
      'total': TextEditingController(), // Initialize total score
    });
    playerCount++; // Increment the player count
    print("playerCount: $playerCount");
    emit(AddTextField());
  }

  void removePlayer(int index) {
    if (players.length > 1) {
      players.removeAt(index);
      playerCount--; // Decrement the player count
      emit(RemoveTextField());
    }
    if (players.length == 1) {
      players[0]['name']?.text = '';
    }
  }

  void startGame(BuildContext context) {
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

  void resetScores() {
    for (var player in players) {
      player['score']?.text = ""; // Reset score to 0
      player['total']?.text = ""; // Reset total score to 0
    }
    roundCount = 1; // Reset round count
    emit(ResetScores());
  }

  void newRound() {
    for (var player in players) {
      final currentScore = int.tryParse(player['score']?.text ?? "0") ?? 0;
      final total = int.tryParse(player['total']?.text ?? "0") ?? 0;
      player['total']?.text =
          (total + currentScore).toString(); // Update total score
    }
    players.forEach((player) {
      player['score']?.text = ""; // Clear the score for the new round
    });
    roundCount++;
    emit(NewRound());
  }

  void homeButton(BuildContext context) {
    players.forEach((player) {
      player['name']?.clear(); // Dispose of the controllers
      player['score']?.clear();
      player['total']?.clear();
    });
    roundCount = 1; // Reset round count
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    emit(HomeButton());
  }

  void finalScore(BuildContext context) {
    newRound();
    Navigator.pushNamed(context, 'final');
  }
}
