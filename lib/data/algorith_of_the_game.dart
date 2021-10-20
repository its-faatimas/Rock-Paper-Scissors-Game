import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

String movePlayer() {
  print("Would You like (R)ock, (P)aper, or (S)cissors?");
  String selection = stdin.readLineSync()!.toUpperCase();
  String? playerSelection;

  switch (selection) {
    case "R":
      debugPrint("Rock");
      playerSelection = "Rock";
      break;
    case "P":
      debugPrint("Paper");
      playerSelection = "Paper";

      break;
    case "S":
      debugPrint("Scissors");
      playerSelection = "Scissors";

      break;
    default:
      debugPrint("Quit");
      break;
  }
  return playerSelection!;
}

String moveComputer() {
  Random rand = new Random();
  int move = rand.nextInt(3);
  String? computerSelection;

  switch (move) {
    case 0:
      debugPrint("Rock");
      computerSelection = "Rock";
      break;
    case 1:
      debugPrint("Paper");
      computerSelection = "Paper";
      break;
    case 2:
      debugPrint("Scissors");
      computerSelection = "Scissors";
      break;
    default:
      break;
  }
  return computerSelection!;
}

String whoWins(String playerMove, String computerMove) {
  if (playerMove == computerMove) {
    debugPrint("Tie");
    return "Tie";
  } else if (playerMove == "Rock" && computerMove == "Scissors") {
    debugPrint("You Win!");
    return "You Win!";
  } else if (playerMove == "Scissors" && computerMove == "Paper") {
    debugPrint("You Win!");
    return "You Win!";
  } else if (playerMove == "Paper" && computerMove == "Rock") {
    debugPrint("You Win!");
    return "You Win!";
  } else {
    debugPrint("Computer Wins!");
    return "Computer Wins!";
  }
}

void main() {
  while (true) {
    debugPrint("Rock, Paper, Scissors Shoot!");
    String playerMove = movePlayer();

    if (playerMove == "Quit") {
      return;
    }

    debugPrint("You played $playerMove");
    String computerMove = moveComputer();
    debugPrint("Computer played $computerMove");
    debugPrint(whoWins(playerMove, computerMove));
  }
}
