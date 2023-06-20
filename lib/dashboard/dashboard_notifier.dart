import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/dashboard/score_model.dart';
import 'package:diploma_work_mobile/dashboard/dashboard_service.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:diploma_work_mobile/misc/util_services/loading_provider.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';

class DashboardNotifier extends AsyncNotifier<Score> {
  final dashBoardService = DashboardService();

  @override
  FutureOr<Score> build() async {
    final userId = ref.watch(userProvider).value!.id;
    if(userId == null) return Score.empty();

    return await dashBoardService.getScore(userId);
  }

  Future<void> getScore(int userId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await dashBoardService.getScore(userId);
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
}