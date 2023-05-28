import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/styles/decorations.dart';

class DefaultInputField extends ConsumerWidget {
  const DefaultInputField({Key? key, required this.controller, required this.inputType, this.hintText = ""}) : super(key: key);

  final TextEditingController controller;
  final TextFieldType inputType;
  final String hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool _isConfirmation = _isConfirmationValue(inputType);
    final bool _obscure = _isConfirmation
        ? ref.watch(_confirmPasswordFieldObscureProvider)
        : ref.watch(_passwordFieldObscureProvider);

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        decoration: !_isPasswordField(inputType)
            ? defaultTextFieldDecoration(
                hintText: _determineHintText(inputType, hintText),
                context: context,
              )
            : defaultTextFieldDecoration(
                hintText: _determineHintText(inputType, hintText),
                context: context,)
                  .copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Checking which icon should be used based on if the text is obscured or not
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      iconSize: 20,
                      onPressed: (){
                        _isConfirmation
                            ? ref.read(_confirmPasswordFieldObscureProvider.notifier).state = !_obscure
                            : ref.read(_passwordFieldObscureProvider.notifier).state = !_obscure;
                        },
                      ),
        ),
        controller: controller,
        enableSuggestions: _isPasswordField(inputType)
            ? false
            : true,
        autocorrect: false,
        obscureText: _isPasswordField(inputType)
            ? _obscure
            : false,
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }

  String _determineHintText(TextFieldType inputType, String hintText){
    switch(inputType) {
      case TextFieldType.email:
        return "Email";
      case TextFieldType.password:
        return "Password";
      case TextFieldType.passwordConfirmation:
        return "Confirm Password";
      case TextFieldType.text:
        if(hintText != ""){
          return hintText;
        }
        return "Text";
    }
  }

  bool _isPasswordField(TextFieldType inputType){
    if(inputType == TextFieldType.passwordConfirmation || inputType == TextFieldType.password){
      return true;
    }
    return false;
  }

  bool _isConfirmationValue(TextFieldType inputType){
    if(inputType == TextFieldType.passwordConfirmation){
      return true;
    }
    return false;
  }
}

final _passwordFieldObscureProvider = StateProvider.autoDispose<bool>(
      (ref) => true,
);

final _confirmPasswordFieldObscureProvider = StateProvider.autoDispose<bool>(
      (ref) => true,
);

enum TextFieldType {
  email,
  password,
  passwordConfirmation,
  text,
}