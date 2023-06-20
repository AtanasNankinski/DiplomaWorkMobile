import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:diploma_work_mobile/dashboard/score_model.dart';
import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';

class LastGameCard extends StatelessWidget {
  const LastGameCard({Key? key, required this.score}) : super(key: key);

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: colorLastGameCardBG,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Last Game",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 6,),
                    RichText(
                      text: TextSpan(
                        text: "Team: ",
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: _determineTeam(score.lastGame),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: _determineTeamColor(score.lastTeam),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 6,),
                    RichText(
                      text: TextSpan(
                        text: "Result: ",
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: _determineResult(score.lastGame, score.lastTeam),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: _determineOutcomeColor(score.lastGame, score.lastTeam),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6,),
                    RichText(
                      text: TextSpan(
                        text: "Date: ",
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: _getLastGameDate(score.lastGame),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: colorTextNeutral,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _determineTeam(PastGame? game) {
    if(game == null) return "N/A";

    switch(game.team) {
      case 2:
        return "Red";
      case 3:
        return "Blue";
      default:
        return "N/A";
    }
  }

  String _determineResult(PastGame? lastGame, int? lastTeam) {
    if(lastGame == null || lastTeam == null) {
      return "N/A";
    }

    if(lastGame.team == lastTeam) {
      return "Victory";
    }
    return "Defeat";
  }

  Color _determineTeamColor(int? lastTeam) {
    if(lastTeam == null) return colorTextNeutral;

    switch(lastTeam) {
      case 2:
        return colorTextRed;
      case 3:
        return colorTextBlue;
      default:
        return colorTextNeutral;
    }
  }

  Color _determineOutcomeColor(PastGame? lastGame, int? lastTeam) {
    if(lastGame == null || lastTeam == null) {
      return colorTextNeutral;
    }

    if(lastGame.team == lastTeam) {
      return colorVictoryGreen;
    }
    return colorTextRed;
  }

  String _getLastGameDate(PastGame? lastGame) {
    if(lastGame == null) {
      return "N/A";
    }

    return lastGame.date;
  }
}
