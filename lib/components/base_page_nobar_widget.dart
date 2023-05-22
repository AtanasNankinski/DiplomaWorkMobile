import 'package:flutter/material.dart';

class BasePageNoBarWidget extends StatelessWidget {
  final Widget child;

  const BasePageNoBarWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/PagesBG.png'
              ),
              fit: BoxFit.fitHeight
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
