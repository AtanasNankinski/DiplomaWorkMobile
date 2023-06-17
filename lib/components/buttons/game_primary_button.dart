import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

Widget gamePrimaryButton({
  required VoidCallback? onPressed,
  required String content,
  required BuildContext context,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      content,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: colorButtonText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    ),
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(100, 30),
      backgroundColor: colorButtonMain,
      foregroundColor: colorButtonText,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(12)
          )
      ),
      disabledBackgroundColor: colorButtonDisabled,
    ),
  );
}