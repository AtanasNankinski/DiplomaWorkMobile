import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:flutter/material.dart';

Widget sectionSeparator(String title, BuildContext context) {
  return Row(
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      Expanded(
        child: Container(
          color: colorMenuSeparator,
          height: 1,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, top: 6, bottom: 6),
        ),
      ),
    ],
  );
}