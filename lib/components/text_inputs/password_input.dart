import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordInputField extends ConsumerWidget {
  const PasswordInputField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool obscure = ref.watch(passwordFieldObscureProvider);

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Confirm Password",
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.black.withOpacity(0.4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black, width: 1)
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.9),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: IconButton(
            icon: Icon(
              // Checking which icon should be used based on if the text is obscured or not
              obscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            iconSize: 20,
            onPressed: (){
              ref.read(passwordFieldObscureProvider.notifier).state = !obscure;
            },
          ),
        ),
        controller: controller,
        enableSuggestions: false,
        autocorrect: false,
        obscureText: obscure,
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}

final passwordFieldObscureProvider = StateProvider.autoDispose<bool>(
      (ref) => true,
);