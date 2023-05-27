import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_nobar_widget.dart';
import 'package:diploma_work_mobile/components/base_layouts/post_base_layout.dart';
import 'package:diploma_work_mobile/components/buttons/primary_button.dart';
import 'package:diploma_work_mobile/auth/register_providers.dart';
import 'package:diploma_work_mobile/components/text_inputs/confirm_password_input.dart';
import 'package:diploma_work_mobile/components/text_inputs/email_input.dart';
import 'package:diploma_work_mobile/components/text_inputs/password_input.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePageNoBarWidget(
      child: PostBaseLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Register",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const Spacer(),
            EmailTextInput(controller: _emailController),
            PasswordInputField(
              controller: _passwordController,
            ),
            ConfirmPasswordInputField(
              controller: _confirmPasswordController,
            ),
            Center(
              child: Text(
                ref.watch(registerProvider).errorText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: primaryButton(
                onPressed: (){
                  ref.read(registerProvider.notifier).updateData(email: _emailController.text, password: _passwordController.text, confirmPassword: _confirmPasswordController.text);
                  ref.read(registerProvider.notifier).validateData();
                },
                content: 'Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}