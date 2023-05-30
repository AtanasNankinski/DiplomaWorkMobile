import 'package:flutter/material.dart';

class BasePageNoBarWidget extends StatelessWidget {
  final Widget child;

  const BasePageNoBarWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/pages_background.png'
              ),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
