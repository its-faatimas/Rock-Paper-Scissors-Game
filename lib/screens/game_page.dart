import 'dart:io';
import 'dart:math';

import 'package:exam_3_flutter/models/users.dart';
import 'package:exam_3_flutter/screens/scoreboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GamePage extends StatefulWidget {
  final User user;
  GamePage(this.user);

  @override
  _GamePageState createState() => _GamePageState(this.user);
}

class _GamePageState extends State<GamePage> {
  User user;
  _GamePageState(this.user);
  String? playerSelection = "Nothing";
  String? gameResult = "Press any of these three buttons";
  String? computerSelection = "Nothing";
  int playerWins = 0;
  int computerWins = 0;

  @override
  Widget build(BuildContext context) {
    print(_images['Rock']);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          _process(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              rockButton(context),
              paperButton(context),
              scissorsButton(context),
            ],
          )
        ],
      ),
    );
  }

  TextButton scoreBoard(BuildContext context) {
    return TextButton(
      child: Text("Scoreboard"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScoreBoard(playerWins, computerWins)));
      },
    );
  }

  ElevatedButton scissorsButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Scissors";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: Image(
        image: AssetImage("assets/images/scissors.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton paperButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Paper";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: Image(
        image: AssetImage("assets/images/paper.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton rockButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Rock";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: image("assets/images/rock.png"),
    );
  }

  Image image(String imageAddress) {
    return Image(
      image: AssetImage(imageAddress),
      fit: BoxFit.cover,
    );
  }

  String computerMove() {
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
      playerWins++;

      return "You Win!";
    } else if (playerMove == "Scissors" && computerMove == "Paper") {
      debugPrint("You Win!");
      playerWins++;

      return "You Win!";
    } else if (playerMove == "Paper" && computerMove == "Rock") {
      debugPrint("You Win!");
      playerWins++;

      return "You Win!";
    } else {
      debugPrint("Computer Wins!");
      computerWins++;
      return "Computer Wins!";
    }
  }

  String movePlayer(String? selection) {
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

  Column _process() {
    return Column(
      children: [
        Text(
          "Computer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 14.0,),
        _getImage(_images[computerSelection].toString()),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
              "Game result: $gameResult",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        RotatedBox(
            quarterTurns: 2,
            child: _getImage(_images[playerSelection].toString())),
        Text(user.username!, style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }

  Map<String, String> _images = {
    "Rock": "assets/images/rock.png",
    "Paper": "assets/images/paper.png",
    "Scissors": "assets/images/scissors.png",
    "Nothing": "assets/images/main.png",
  };

  Image _getImage(String image) => Image.asset(
        image,
        height: 100,
        width: 100,
      );
}
