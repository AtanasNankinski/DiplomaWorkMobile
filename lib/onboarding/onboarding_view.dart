import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/base_layouts/post_base_layout.dart';

class OnboardingView extends StatelessWidget {
  final String title;
  final String content;
  final Widget button;

  const OnboardingView({required this.title, required this.content, required this.button, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostBaseLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: button,
          ),
        ],
      ),
    );
  }
}
