import 'package:flutter/material.dart';

@immutable
class Game {
  final String title;
  final String description;
  final String date;

  const Game({
    required this.title,
    required this.description,
    required this.date,
  });

  factory Game.fromJson(Map<String, dynamic> map) {
    return Game(
      title: map['title'],
      description: map['description'],
      date: map['date'],
    );
  }

  factory Game.empty() {
    return const Game(title: "", description: "", date: "");
  }
}