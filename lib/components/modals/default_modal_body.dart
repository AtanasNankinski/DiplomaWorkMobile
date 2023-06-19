import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

void defaultModalBody(BuildContext context, Widget child) {
  showModalBottomSheet(
    backgroundColor: colorModalMain,
    context: context,
    builder: (context) {
      return child;
    },
  );
}