import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/styles/decorations.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';

class AddGameInput extends StatelessWidget {
  const AddGameInput({Key? key, required this.controller, required this.hintText, required this.onChanged, required this.isBig, this.enabled = true,}) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final bool isBig;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        decoration: addGameTextFieldDecoration(
          hintText: hintText,
          context: context,
        ),
        onChanged: onChanged,
        controller: controller,
        enableSuggestions: true,
        autocorrect: true,
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: colorTextInputField,
        ),
        maxLines: isBig ? 6 : 1,
        enabled: enabled,
      ),
    );
  }
}
