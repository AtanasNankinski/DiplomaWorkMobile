import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/replica_container.dart';

@immutable
class Replica {
  final String replicaName;
  final ReplicaType replicaType;
  final double replicaPower;

  const Replica({
    required this.replicaName,
    required this.replicaType,
    required this.replicaPower,
  });
}