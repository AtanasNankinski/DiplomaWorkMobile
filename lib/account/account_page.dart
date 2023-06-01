import 'package:diploma_work_mobile/components/buttons/primary_outlined_button.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/components/default_avatar.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String username = "";

    ref.watch(authProvider).whenData((value) => {
      username = value.name
    });

    return BasePageWidget(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            sectionSeparator("Avatar", context),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: defaultAvatar(context: context, size: AvatarSizes.big, username: username, background: Colors.yellow),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: primaryOutlinedButton(
                context: context,
                buttonText: "Change",
                onPressed: (){

                },
              ),
            ),
            const SizedBox(height: 20,),
            sectionSeparator("Name", context),
          ],
        ),
      ),
      title: "Account",
    );
  }
}