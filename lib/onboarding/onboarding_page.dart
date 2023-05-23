import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/onboarding/onboarding_view.dart';
import 'package:diploma_work_mobile/components/base_page_nobar_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
            title: "Page 1",
            content: "Content",
            button: onboardingButton(
              onPressed: () {
                pageController.animateToPage(
                  1,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              content: "Next",
            ),
          ),
          OnboardingView(
            title: "Page 2",
            content: "Content",
            button: onboardingButton(
              onPressed: (){

              },
              content: "Next",
            ),
          ),
          OnboardingView(
            title: "Page 3",
            content: "Content",
            button: onboardingButton(
              onPressed: (){},
              content: "Next",
            ),
          ),
          OnboardingView(
            title: "Page 4",
            content: "Content",
            button: onboardingButton(
              onPressed: (){},
              content: "Get Started",
            ),
          ),
        ],
      ),
    );
  }
}

Widget onboardingButton({required VoidCallback onPressed, required String content}){
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(content),
  );
}

final StateNotifierProvider<PageViewNotifier, int> pageViewProvider = StateNotifierProvider(
    (ref) => PageViewNotifier(),
);

class PageViewNotifier extends StateNotifier<int> {
  PageViewNotifier() : super(0);

  void next() {
    if(state < 4){
      state++;
    }
  }

  void previous() {
    if(state < 1){
      state--;
    }
  }
}