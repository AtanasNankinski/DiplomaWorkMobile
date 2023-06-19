import 'package:diploma_work_mobile/games/games_providers.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseTeamModal extends ConsumerWidget {
  const ChooseTeamModal({Key? key, required this.userId, required this.gameId}) : super(key: key);

  final int userId;
  final int gameId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Text(
            "Which team won?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: (){
                  ref.read(activeGamesProvider.notifier).finalizeGame(userId, 2, gameId);
                  Navigator.pop(context);
                },
                child: Text(
                  "Red Team",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: colorTextRed,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: (){
                  ref.read(activeGamesProvider.notifier).finalizeGame(userId, 3, gameId);
                  Navigator.pop(context);
                },
                child: Text(
                  "Blue Team",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: colorTextBlue,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
