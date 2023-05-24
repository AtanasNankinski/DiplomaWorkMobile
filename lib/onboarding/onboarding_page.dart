import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/onboarding/onboarding_view.dart';
import 'package:diploma_work_mobile/components/base_page_nobar_widget.dart';
import 'package:diploma_work_mobile/components/buttons/primary_button.dart';
import 'package:diploma_work_mobile/onboarding/onboarding_provider.dart';
import 'package:diploma_work_mobile/navigation/routing_constants.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageNoBarWidget(
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: [
          OnboardingView(
            title: "Welcome",
            content: "Airsoft Kings mobile is out and ready for you - waste no time and jump right to it!",
            button: primaryButton(
              onPressed: () {
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              content: "Next",
            ),
          ),
          OnboardingView(
            title: "What is Airsoft Kings Mobile?",
            content: "This is mobile application for organizing airsoft games by Airsoft Kings. You can see the game’s location and additional information.",
            button: primaryButton(
              onPressed: (){
                pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              content: "Next",
            ),
          ),
          OnboardingView(
            title: "So only games?",
            content: "Actually no, here you can also see who else is playing in a game, with what replica, what teams are participating and customize your experience!",
            button: primaryButton(
              onPressed: (){
                pageController.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              content: "Next",
            ),
          ),
          OnboardingView(
            title: "Sounds exciting already?",
            content: "Enough talking - better see for yourself. It’s time to experience airsoft at a whole new level! Are you ready?",
            button: primaryButton(
              onPressed: (){
                print("Pressed Get Started button!");
                ref.read(onboardingProvider.notifier).setOnboarding(true);
                Navigator.pushNamed(context, RoutingConst.registerRoute);
              },
              content: "Get Started",
            ),
          ),
        ],
      ),
    );
  }
}