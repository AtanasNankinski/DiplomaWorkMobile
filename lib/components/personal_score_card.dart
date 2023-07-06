import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/dashboard/score_model.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';

class PersonalScoreCard extends StatelessWidget {
  const PersonalScoreCard({Key? key, required this.score}) : super(key: key);

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: colorScoreCardBG,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Personal Score",
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
                    Text(
                      "Victories: ${score.victories}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 6,),
                    Text(
                      "Defeats: ${score.defeats}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6,),
                    Text(
                      "Victory/Defeat Ratio:",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      _determineVDRatio(score),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: _determineVDColor(score),
                      ),
                    ),
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

  String _determineVDRatio(Score score) {
    if(score.victories == 0 && score.defeats == 0) return 'N/A';
    if(score.victories == 0 && score.defeats != 0) return score.defeats.toString();
    if(score.victories != 0 && score.defeats == 0) return score.victories.toString();

    return (score.victories/score.defeats).toStringAsFixed(1);
  }

  Color _determineVDColor(Score score) {
    if(score.victories/score.defeats > 1) {
      return colorTextGreen;
    } else if(score.victories/score.defeats < 1) {
      return colorTextRed;
    }
    return colorTextNeutral;
  }
}
