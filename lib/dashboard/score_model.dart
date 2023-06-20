import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';

@immutable
class Score {
  final int? id;
  final int victories;
  final int defeats;
  final PastGame? lastGame;
  final int? lastTeam;

  const Score({
    required this.id,
    required this.victories,
    required this.defeats,
    required this.lastGame,
    required this.lastTeam,
  });

  factory Score.fromJson(Map<String, dynamic> map) {
    return Score(
      id: map['id'] as int?,
      victories: map['victories'] as int,
      defeats: map['defeats'] as int,
      lastGame: PastGame.fromJson(map['last_game']),
      lastTeam: map['last_team'],
    );
  }

  factory Score.empty() {
    return const Score(id: null, victories: 0, defeats: 0, lastGame: null, lastTeam: null);
  }
}