import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_nobar_widget.dart';
import 'package:diploma_work_mobile/components/base_layouts/post_base_layout.dart';
import 'package:diploma_work_mobile/components/buttons/primary_button.dart';
import 'package:diploma_work_mobile/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/util/colors.dart';
import 'package:diploma_work_mobile/components/text_inputs/default_input.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginWatch = ref.watch(loginProvider);
    final loginRead = ref.read(loginProvider.notifier);
    final auth = ref.read(authProvider.notifier);

    return BasePageNoBarWidget(
      child: PostBaseLayout(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const Spacer(),
              DefaultInputField(
                controller: _emailController,
                inputType: TextFieldType.email,
              ),
              DefaultInputField(
                controller: _passwordController,
                inputType: TextFieldType.password,
              ),
              Center(
                child: Text(
                  loginWatch,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 4),
                child: primaryButton(
                  onPressed: (){
                    if(loginRead.validateData(_emailController.text, _passwordController.text)){
                      auth.login(_emailController.text, _passwordController.text, context);
                    }
                    _passwordController.text = "";
                  },
                  context: context,
                  content: 'Login',
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                          text: "Register",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: colorTextGreen,
                              fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){
                              Navigator.pushNamed(context, RoutingConst.registerRoute);
                            }
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
