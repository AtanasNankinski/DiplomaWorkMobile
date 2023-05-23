import 'package:flutter/material.dart';

Widget primaryButton({
  required VoidCallback onPressed,
  required String content
}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(content),
    ),
  );
}

