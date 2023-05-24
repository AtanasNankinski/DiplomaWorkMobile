import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/onboarding/onboarding_notifier.dart';

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, bool>(
      (ref) => OnboardingNotifier(),
);