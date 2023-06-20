import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

class MovePlayerModal extends StatelessWidget {
  const MovePlayerModal({
    Key? key,
    required this.firstLabel,
    required this.secondLabel,
    required this.firstChoicePressed,
    required this.secondChoicePressed,
  }) : super(key: key);

  final TeamOptions firstLabel;
  final TeamOptions secondLabel;
  final VoidCallback firstChoicePressed;
  final VoidCallback secondChoicePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Text(
            "Move to:",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: firstChoicePressed,
                child: Text(
                  _determineLabel(firstLabel),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: _determineTextColor(firstLabel),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: secondChoicePressed,
                child: Text(
                  _determineLabel(secondLabel),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: _determineTextColor(secondLabel),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  String _determineLabel(TeamOptions option) {
    switch(option){
      case TeamOptions.neutral:
        return "Neutral";
      case TeamOptions.red:
        return "Red";
      case TeamOptions.blue:
        return "Blue";
    }
  }

  Color _determineTextColor(TeamOptions option){
    switch(option){
      case TeamOptions.neutral:
        return colorTextNeutral;
      case TeamOptions.red:
        return colorTextRed;
      case TeamOptions.blue:
        return colorTextBlue;
    }
  }
}

enum TeamOptions {
  neutral,
  red,
  blue
}
