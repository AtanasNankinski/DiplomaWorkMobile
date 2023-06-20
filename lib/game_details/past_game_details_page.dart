import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';

class PastGameDetailsPage extends ConsumerWidget {
  const PastGameDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PastGame game = ModalRoute.of(context)!.settings.arguments as PastGame;
    final DateTime date = DateTime.parse(game.date);

    return BasePageWidget(
      title: "Game Details",
      hasDrawer: false,
      hasPadding: false,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              game.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 18,),
            Text(
              "Date: ${date.day}.${date.month}.${date.year}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            sectionSeparator("Game Info", context, false),
            Text(
              game.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            sectionSeparator("Result", context, false),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _determineVictoryTeam(game.team),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: _determineVictoryTextColor(game.team),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _determineVictoryTeam(int team) {
    switch(team) {
      case 2:
        return "Red Team Victory";
      case 3:
        return "Blue Team Victory";
      default:
        return "N/A";
    }
  }

  Color _determineVictoryTextColor(int team) {
    switch(team) {
      case 2:
        return colorTextRed;
      case 3:
        return colorTextBlue;
      default:
        return colorTextNeutral;
    }
  }
}
