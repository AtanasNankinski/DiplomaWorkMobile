import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/components/navigation_layouts/menu_body.dart';
import 'package:diploma_work_mobile/components/navigation_layouts/menu_header.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User _userType = ref.watch(userProvider).value!;

    return Drawer(
      backgroundColor: colorDrawerBG,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12,),
              const BuildMenuHeader(),
              BuildMenuBody(user: _userType,),
            ],
          ),
        ),
      ),
    );
  }
}
