import 'package:flutter/material.dart';

@immutable
class Replica {
  final int? replicaId;
  final String replicaName;
  final String replicaType;
  final double replicaPower;

  const Replica({
    this.replicaId,
    required this.replicaName,
    required this.replicaType,
    required this.replicaPower,
  });

  factory Replica.fromJson(Map<String, dynamic> map) {
    return Replica(
      replicaId: map['id'] as int,
      replicaName: map['replica_name'] as String,
      replicaType: map['replica_type'] as String,
      replicaPower: map['replica_power'] as double,
    );
  }

  factory Replica.empty() {
    return const Replica(
      replicaName: "",
      replicaType: "",
      replicaPower: 0,
    );
  }
}