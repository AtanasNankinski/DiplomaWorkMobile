import 'dart:async';

import 'package:diploma_work_mobile/misc/error/error_notifier.dart';
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
    try {
      int userId = ref.watch(userProvider).value!.id!;
      final replicas = await replicaService.getReplicas(userId);
      if(replicas.isNotEmpty){
        return replicas;
      }
      return [];
    } catch(e) {
      if(e == ErrorCodes.notFound){
        return [];
      }
      ref.read(errorProvider.notifier).transformError(e.toString());
      return [];
    }
  }

  Future<void> getAllReplicas(int userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      ref.read(isLoadingProvider.notifier).state = true;
      return await replicaService.getReplicas(userId);
    });
    state.when(
      data: (data) {
        ref.read(isLoadingProvider.notifier).state = false;
      },
      error: (error, stackTrace) {
        ref.read(isLoadingProvider.notifier).state = false;
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
      loading: () {
        ref.read(isLoadingProvider.notifier).state = true;
      },
    );
  }

  Future<void> createReplica(String replicaName, String replicaType, double replicaPower, int userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final addedReplica = await replicaService.addReplica(replicaName, replicaType, replicaPower, userId);
      state.value!.add(addedReplica);
      return state.value!;
    });
    state.whenOrNull(
      error: (error, stackTrace){
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
    );
  }

  Future<void> deleteReplica(String replicaName, int userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      ref.read(isLoadingProvider.notifier).state = true;
      await replicaService.deleteReplica(replicaName, userId);
      return await replicaService.getReplicas(userId);
    });
    state.when(
      data: (data) {
        ref.read(isLoadingProvider.notifier).state = false;
      },
      error: (error, stackTrace){
        ref.read(isLoadingProvider.notifier).state = false;
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
      loading: () {
        ref.read(isLoadingProvider.notifier).state = true;
      },
    );
  }

  Future<void> editReplica(String replicaName, String replicaType, double replicaPower, int userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await replicaService.editReplica(replicaName, replicaType, replicaPower, userId);
      getAllReplicas(userId);
      return state.value!;
    });
    state.whenOrNull(
      error: (error, stackTrace){
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
    );
  }
}