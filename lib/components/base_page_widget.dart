import 'package:flutter/material.dart';

class BasePageWidget extends StatelessWidget {
  final Widget child;

  const BasePageWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
    );
  }
}
