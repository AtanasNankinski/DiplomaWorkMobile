import 'package:flutter/material.dart';

@immutable
class Game {
  final int? id;
  final String title;
  final String description;
  final String date;
  final int participants;

  const Game({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.participants
  });

  factory Game.fromJson(Map<String, dynamic> map) {
    return Game(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      participants: map['participants'],
    );
  }

  factory Game.empty() {
    return const Game(id: null, title: "", description: "", date: "", participants: 0);
  }
}