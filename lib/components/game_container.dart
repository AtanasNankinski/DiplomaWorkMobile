import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/games/game_model.dart';
import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/components/buttons/game_primary_button.dart';
import 'package:diploma_work_mobile/components/buttons/game_outlined_button.dart';

class GameContainer extends StatelessWidget {
  const GameContainer({Key? key, required this.game, required this.userType}) : super(key: key);

  final Game game;
  final int userType;

  @override
  Widget build(BuildContext context) {
    final isValid = isGameValid(game);

    return Container(
      height: 160,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            isValid ? 'assets/game_card_bg.png' : 'assets/past_game_card_bg.png',
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
                    onPressed: isValid && userType == 2
                        ? (){}
                        : null,
                    content: isValid
                        ? "Join"
                        : "Past",
                    context: context,
                  ),
                  gameOutlinedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RoutingConst.gameDetails);
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

  bool isGameValid(Game game) {
    if(game.date.isEmpty || DateTime.parse(game.date).isBefore(DateTime.now())) return false;

    return true;
  }
}
