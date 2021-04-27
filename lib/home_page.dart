import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/widgets/game_field_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameFieldButton> buttonsList;

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
                        if (states.contains(MaterialState.pressed))
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5);
                        else if (states.contains(MaterialState.disabled))
                          return buttonsList[i].background;
                        return null; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {  },
                  child: Text(
                    buttonsList[i].text,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 20.0),
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
}
