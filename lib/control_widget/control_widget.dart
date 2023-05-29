import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/register/register_page.dart';
import 'package:diploma_work_mobile/dashboard/dashboard_page.dart';
import 'package:diploma_work_mobile/onboarding/onboarding_page.dart';
import 'package:diploma_work_mobile/onboarding/onboarding_provider.dart';

class ControlWidget extends ConsumerWidget {
  const ControlWidget({Key? key}) : super(key: key);

  final bool isLoggedIn = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasSeenOnboarding = ref.watch(onboardingProvider);

    return isLoggedIn
        ? const DashboardPage()
        : hasSeenOnboarding
          ? RegisterPage()
          : const OnboardingPage();
  }
}
