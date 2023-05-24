import 'package:flutter/material.dart';

Widget primaryButton({
  required VoidCallback onPressed,
  required String content
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(content),
  );
}

