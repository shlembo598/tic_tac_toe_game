import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/widgets/game_field_button.dart';
import 'package:tic_tac_toe_game/widgets/winners_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameFieldButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tic Tac Toe")),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: buttonsList.length,
          itemBuilder: (context, i) => SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled))
                          return buttonsList[i].background;
                        return buttonsList[i].background; // default.
                      },
                    ),
                  ),
                  onPressed: buttonsList[i].enabled?()=> playGame(buttonsList[i]) : null,
                  child: Text(
                    buttonsList[i].text,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 30.0),
                  ),
                ),
              ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 9.0,
      ),),
    );
  }

  List<GameFieldButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer =1;

    var gameFiaeldButtons = <GameFieldButton>[
      new GameFieldButton(id: 1),
      new GameFieldButton(id: 2),
      new GameFieldButton(id: 3),
      new GameFieldButton(id: 4),
      new GameFieldButton(id: 5),
      new GameFieldButton(id: 6),
      new GameFieldButton(id: 7),
      new GameFieldButton(id: 8),
      new GameFieldButton(id: 9),
    ];
    return gameFiaeldButtons;
  }

  void playGame(GameFieldButton gameButton){
    setState(() {
      if (activePlayer ==1) {
        gameButton.text = "X";
        gameButton.background = Colors.teal[400];
        activePlayer = 2;
        player1.add(gameButton.id);
      } else{
        gameButton.text = "O";
        gameButton.background = const Color(0xFFA62632);
        activePlayer = 1;
        player2.add(gameButton.id);
      }
      gameButton.enabled = false;
      checkWinner();
    });
  }

  void checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3) ) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3) ) {
      winner = 2;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6) ) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6) ) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9) ) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9) ) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(4) && player1.contains(7) ) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7) ) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8) ) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8) ) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9) ) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9) ) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(5) && player1.contains(9) ) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9) ) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7) ) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7) ) {
      winner = 2;
    }
    
    if (winner != -1) {
      if (winner == 1) {
        showDialog(context: context,
            builder: (_) => WinnerDialog("You Won!", 'Press reset button to play again!', resetGame));
      }  else {
        showDialog(context: context,
            builder: (_) => WinnerDialog("Ai Won!", 'Press reset button to play again!', resetGame));
      }
    }  
  }
  

  void resetGame() {
    if(Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }
}
