import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailTextInput extends ConsumerWidget {
  final TextEditingController controller;

  const EmailTextInput({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Email",
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.black.withOpacity(0.4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        enableSuggestions: false,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}
