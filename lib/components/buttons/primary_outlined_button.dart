import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

Widget primaryOutlinedButton({required BuildContext context, required String buttonText, required VoidCallback onPressed}) {
  return OutlinedButton(
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(120, 40),
      elevation: 0,
      side: const BorderSide(
        color: colorButtonMain,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)
      ),
    ),
  );
}