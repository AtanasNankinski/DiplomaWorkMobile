import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/util/colors.dart';

Widget primaryButton({
  required VoidCallback onPressed,
  required String content,
  required BuildContext context,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      content,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.bold,
        color: colorButtonText,
      ),
    ),
  );
}

