import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/add_replica/replica_model.dart';
import 'package:diploma_work_mobile/add_replica/replica_service.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/misc/util_services/loading_provider.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';

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
      return await replicaService.getReplicas(userId);
    });
    state.whenOrNull(
        error: (error, stackTrace) {
          ref.read(errorProvider.notifier).transformError(error.toString());
        }
    );
  }

  Future<void> createReplica(String replicaName, String replicaType, double replicaPower, int userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final addedReplica = await replicaService.addReplica(replicaName, replicaType, replicaPower, userId);
      state.value!.add(addedReplica);
      return state.value!;
    });
    state.when(
      data: (data) {
        ref.read(isLoadingProvider.notifier).state = false;
      },
      error: (error, stackTrace){
        ref.read(errorProvider.notifier).transformError(error.toString());
        ref.read(isLoadingProvider.notifier).state = false;
      },
      loading: (){
        ref.read(isLoadingProvider.notifier).state = true;
      },
    );
  }

  Future<void> deleteReplica(String replicaName, int userId) async {

  }
}