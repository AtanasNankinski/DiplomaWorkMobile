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
    final int _userType = ref.watch(userProvider).value!.userType;

    return Drawer(
      backgroundColor: colorDrawerBG,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30,),
            const BuildMenuHeader(),
            buildMenuBody(context, _userType),
          ],
        ),
      ),
    );
  }
}
