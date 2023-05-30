import 'dart:async';

import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/navigation/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/auth_service.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/error/error_provider.dart';
import 'package:diploma_work_mobile/util_services/shared_preferences_service.dart';

class AuthNotifier extends AsyncNotifier<User> {
  final authService = AuthService();

  @override
  FutureOr<User> build() async {
    try {
      return SharedPreferencesService().getUser();
    } catch(e) {
      ref.read(errorProvider.notifier).createException(exception: e.toString(), errorTitle: "Server Error");
      return User.empty();
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await authService.logout();
    });
    state.when(
      data: (data){},
      error: (error, stackTrace){
        ref.read(errorProvider.notifier).createException(exception: error.toString(), errorTitle: "Logout Error");
      },
      loading: (){},
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
        _checkError(error.toString());
      }
    );
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await authService.register(email, password);
    });
    state.when(
      data: (data) {},
      error: (error, stackTrace) {
        _checkError(error.toString());
      },
      loading: (){},
    );
  }

  void _checkError(String error) async {
    if(error == '422'){
      ref.read(registerProvider.notifier).setErrorMessage(errorMessage: "Email is already taken or credentials are incorrect.");
      ref.read(loginProvider.notifier).setErrorMessage(errorMessage: "Email is already taken or credentials are incorrect.");
    }else if(error == '401'){
      ref.read(registerProvider.notifier).setErrorMessage(errorMessage: "Wrong credentials.");
      ref.read(loginProvider.notifier).setErrorMessage(errorMessage: "Wrong credentials.");
    }else {
      ref.read(errorProvider.notifier).createException(exception: error, errorTitle: "Unknown Error");
    }
  }
}