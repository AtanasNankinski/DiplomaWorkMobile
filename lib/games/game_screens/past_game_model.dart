import 'package:flutter/material.dart';

@immutable
class PastGame {
  final int? id;
  final String title;
  final String description;
  final String date;
  final int participants;
  final int team;

  const PastGame({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.participants,
    required this.team,
  });

  factory PastGame.fromJson(Map<String, dynamic> map) {
    return PastGame(
      id: map['id'],
      title: map['game_title'],
      description: map['game_description'],
      date: map['game_date'],
      participants: map['participants'],
      team: map['team'],
    );
  }

  factory PastGame.empty() {
    return const PastGame(id: null, title: "", description: "", date: "", participants: 0, team: 0);
  }
}