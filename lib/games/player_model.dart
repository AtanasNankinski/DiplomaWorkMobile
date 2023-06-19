import 'package:flutter/cupertino.dart';

@immutable
class Player {
  final int? id;
  final int user;
  final int replica;
  final int team;

  Player({required this.id, required this.user, required this.replica, required this.team});

  factory Player.fromJson(Map<String, dynamic> map) {
    return Player(
      id: map['id'],
      user: map['user'],
      replica: map['replica'],
      team: map['team'],
    );
  }

  factory Player.empty() {
    return Player(id: null, user: 0, replica: 0, team: 0);
  }
}