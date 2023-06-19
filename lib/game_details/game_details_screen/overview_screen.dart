import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/games/game_model.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.parse(game.date);

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            game.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 18,),
          Text(
            "Date: ${date.day}.${date.month}.${date.year}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          sectionSeparator("Game Info", context, false),
          Text(
            game.description,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
