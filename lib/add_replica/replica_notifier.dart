import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/add_replica/replica_model.dart';
import 'package:diploma_work_mobile/components/replica_container.dart';
import 'package:diploma_work_mobile/add_replica/replica_service.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';

class ReplicaNotifier extends AsyncNotifier<List<Replica>> {
  final ReplicaService replicaService = ReplicaService();

  @override
  FutureOr<List<Replica>> build() async {
    int userId = ref.watch(userProvider).value!.id!;
    final replicas = await replicaService.getReplicas(userId);
    if(replicas.isNotEmpty){
      return replicas;
    }
    return [];
  }

  Future<void> getAllReplicas(int userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return replicaService.getReplicas(userId);
    });
  }

  Future<void> createReplica(String replicaName, ReplicaType replicaType, double replicaPower) async {

  }

  Future<void> deleteReplica(String replicaName, int userId) async {

  }
}