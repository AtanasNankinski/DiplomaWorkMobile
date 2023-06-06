import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

Widget addReplicaContainer({required BuildContext context, required VoidCallback onPressed}) {
  return Container(
    width: 140,
    height: 100,
    decoration: BoxDecoration(
      color: colorAddReplicaBoxBG,
      border: Border.all(
          color: colorAddReplicaBoxBorder,
          width: 2
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
    ),
    child: Center(
      child: IconButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        splashRadius: 20,
        icon: const Icon(
          Icons.add,
          color: colorIconButtonGrey,
          size: 50,
        ),
      ),
    ),
  );
}