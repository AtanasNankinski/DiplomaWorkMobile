import 'package:flutter/material.dart';

class BasePageWidget extends StatelessWidget {
  final Widget child;
  final String title;

  const BasePageWidget({required this.child, required this.title, Key? key}) : super(key: key);

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
        appBar: AppBar(
          title: Center(
            child: Text(
              title
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: child
          ),
        ),
      ),
    );
  }
}
