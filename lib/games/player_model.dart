import 'package:flutter/material.dart';
import 'package:diploma_work_mobile/add_replica/replica_model.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';

@immutable
class Player {
  final int? id;
  final String user;
  final Replica replica;
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
    return Player(id: null, user: "", replica: Replica.empty(), team: 0);
  }
}