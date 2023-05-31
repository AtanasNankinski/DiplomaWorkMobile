import 'package:flutter/material.dart';

Widget loadingWidget() {
  return SizedBox.expand(
    child: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.black.withOpacity(0.8),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
    ),
  );
}