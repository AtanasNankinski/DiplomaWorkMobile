import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

Widget gameOutlinedButton({required VoidCallback onPressed, required String content, required BuildContext context}) {
  return OutlinedButton(
    onPressed: onPressed,
    child: Text(
      content,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14
      ),
    ),
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(100, 30),
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