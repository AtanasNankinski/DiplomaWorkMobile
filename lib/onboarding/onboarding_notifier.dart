import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/util_services/shared_preferences_service.dart';

class OnboardingNotifier extends StateNotifier<bool> {
  OnboardingNotifier() : super(SharedPreferencesService().getOnboarding());

  void getOnboarding() {
    state = SharedPreferencesService().getOnboarding();
  }

  Future<void> setOnboarding(bool onboarding) async {
    await SharedPreferencesService().setOnboarding(onboarding);
  }
}