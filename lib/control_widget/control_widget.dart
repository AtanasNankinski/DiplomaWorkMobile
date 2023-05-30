import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/register/register_page.dart';
import 'package:diploma_work_mobile/dashboard/dashboard_page.dart';
import 'package:diploma_work_mobile/onboarding/onboarding_page.dart';
import 'package:diploma_work_mobile/onboarding/onboarding_provider.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';

class ControlWidget extends ConsumerWidget {
  const ControlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasSeenOnboarding = ref.watch(onboardingProvider);
    final bool isLoggedIn = ref.watch(authProvider).when(
      data: (data) {
        if(data != User.empty()){
          return true;
        }
        return false;
      },
      error: (error, stackTrace) {
        return false;
      },
      loading: () {
        return false;
      },
    );

    return isLoggedIn
        ? const DashboardPage()
        : hasSeenOnboarding
          ? RegisterPage()
          : const OnboardingPage();
  }
}
