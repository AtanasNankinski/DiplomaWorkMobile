import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/misc/util_services/shared_preferences_service.dart';

class OnboardingNotifier extends Notifier<bool> {
  @override
  bool build() {
    try {
      return SharedPreferencesService().getOnboarding();
    } catch(e) {
      ref.read(errorProvider.notifier).createException(exception: e.toString(), errorTitle: "Shared Pref Error");
      return false;
    }
  }

  void getOnboarding() {
    try {
      state = SharedPreferencesService().getOnboarding();
    } catch(e) {
      ref.read(errorProvider.notifier).createException(exception: e.toString(), errorTitle: "Shared Pref Error");
    }
  }

  Future<void> setOnboarding(bool onboarding) async {
    try {
      await SharedPreferencesService().setOnboarding(onboarding);
    } catch(e) {
      ref.read(errorProvider.notifier).createException(exception: e.toString(), errorTitle: "Shared Pref Error");
    }
  }
}