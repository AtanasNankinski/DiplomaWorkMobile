import 'package:flutter/material.dart';

Widget validationErrorText(BuildContext context, String errorText) {
  return Center(
    child: Text(
      errorText,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Colors.red,
      ),
      textAlign: TextAlign.center,
    ),
  );
}