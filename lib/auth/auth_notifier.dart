import 'dart:async';

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
      return User(id: null, name: "",email: "", userType: 0, accessToken: "");
    }
  }

  Future<void> logout() async {
    try {
      await authService.logout();
    } catch(e) {
      ref.read(errorProvider.notifier).createException(exception: e.toString(), errorTitle: "Server Error");
    }
  }

  Future<void> register(String email, String password) async {
    try {
      state = AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        return await authService.register(email, password);
      });
    } catch(e) {
      ref.read(errorProvider.notifier).createException(exception: "Error occured while registering: $e", errorTitle: "Register Error");
    }
  }
}