import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  final String title;
  final String content;
  final Widget button;

  const OnboardingView({required this.title, required this.content, required this.button, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(title),
          SizedBox(height: 30,),
          Text(content),
          SizedBox(height: 30,),
          button
        ],
      ),
    );
  }
}
