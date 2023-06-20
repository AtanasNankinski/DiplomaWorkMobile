import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';
import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/components/buttons/game_primary_button.dart';
import 'package:diploma_work_mobile/components/buttons/game_outlined_button.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';

class PastGameContainer extends ConsumerWidget {
  const PastGameContainer({Key? key, required this.game, required this.user}) : super(key: key);

  final PastGame game;
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/past_game_card_bg.png',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              game.title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
            margin: const EdgeInsets.only(bottom: 8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date: ${game.date}",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 14,),
                  Text(
                    "Participants: ${game.participants}",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Column(
                children: [
                  gamePrimaryButton(
                    onPressed: null,
                    content: "Past",
                    context: context,
                  ),
                  gameOutlinedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RoutingConst.pastGameDetails, arguments: game);
                    },
                    content: 'Details',
                    context: context,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
