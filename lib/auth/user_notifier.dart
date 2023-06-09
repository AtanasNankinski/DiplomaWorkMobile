import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/auth_service.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:diploma_work_mobile/misc/util_services/shared_preferences_service.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/misc/util_services/loading_provider.dart';
import 'package:diploma_work_mobile/account/account_service.dart';
import 'package:diploma_work_mobile/account/account_providers.dart';

class UserNotifier extends AsyncNotifier<User> {
  final authService = AuthService();
  final accountService = AccountService();

  @override
  FutureOr<User> build() async {
    try {
      return SharedPreferencesService().getUser();
    } catch(e) {
      ref.read(errorProvider.notifier).createException(exception: e.toString(), errorTitle: "Server Error");
      return User.empty();
    }
  }

  Future<void> logout(BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      ref.read(isLoadingProvider.notifier).state = true;
      return await authService.logout();
    });
    state.when(
      data: (data) {
        ref.read(isLoadingProvider.notifier).state = false;
      },
      error: (error, stackTrace){
        ref.read(isLoadingProvider.notifier).state = false;
        ref.read(errorProvider.notifier).createException(exception: error.toString(), errorTitle: "Logout Error");
      },
      loading: () {
        ref.read(isLoadingProvider.notifier).state = true;
      }
    );
  }

  Future<void> login(String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await authService.login(email, password);
    });
    state.whenOrNull(
      data: (data) {
        if(data != User.empty()){
          Navigator.pushNamed(context, RoutingConst.defaultRoute);
        }
      },
      error: (error, stackTrace) {
        String errorText = ref.read(errorProvider.notifier).checkError(error.toString());
        ref.read(loginProvider.notifier).setErrorMessage(errorMessage: errorText);
      }
    );
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await authService.register(email, password);
    });
    state.whenOrNull(
      data: (data) async {
        if(data.id != null) {
          await ref.read(profilePicProvider.notifier).initialProfilePic(data.id!);
        }
      },
      error: (error, stackTrace) {
        String errorText = ref.read(errorProvider.notifier).checkError(error.toString());
        ref.read(registerProvider.notifier).setErrorMessage(errorMessage: errorText);
      },
    );
  }

  Future<void> updateUsername(String name) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await accountService.changeUsername(name, state.value!.id!);
    });
    state.whenOrNull(
      error: (error, stackTrace) {
        String errorText = ref.read(errorProvider.notifier).checkError(error.toString());
        ref.read(accountPageProvider.notifier).setErrorMessage(errorMessage: errorText);
      },
    );
  }
}