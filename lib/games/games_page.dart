import 'package:diploma_work_mobile/components/game_container.dart';
import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/admin_panel/game_model.dart';

class GamesPage extends StatelessWidget {
  GamesPage({Key? key}) : super(key: key);

  final mockedGames = [
    const Game(id: 0, title: "Mecha Polyana Game 1", description: "This is some text here he he", date: "2023-11-04", participants: 1),
    const Game(id: 1, title: "Mecha Polyana Game 2", description: "This is some text here he he", date: "2023-11-05", participants: 5),
    const Game(id: 2, title: "Mecha Polyana Game 3", description: "This is some text here he he", date: "2023-11-06", participants: 20),
    const Game(id: 3, title: "Mecha Polyana Game 4", description: "This is some text here he he", date: "2023-11-07", participants: 30),
    const Game(id: 4, title: "Mecha Polyana Game 5", description: "This is some text here he he", date: "2023-11-08", participants: 23),
  ];
  final mockedPastGames = [
    const Game(id: 5, title: "Shumen Past 1", description: "This is some text here he he", date: "2023-04-08", participants: 53),
    const Game(id: 6, title: "Shumen Past 2", description: "This is some text here he he", date: "2023-04-09", participants: 41),
  ];

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      hasDrawer: true,
      title: "Games",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for(var game in mockedGames)
            GameContainer(game: game),
          for(var pastGame in mockedPastGames)
            GameContainer(game: pastGame),
        ],
      ),
    );
  }
}