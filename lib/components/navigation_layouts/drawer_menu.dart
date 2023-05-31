import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/components/navigation_layouts/menu_body.dart';
import 'package:diploma_work_mobile/components/navigation_layouts/menu_header.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  final bool hasProfilePic = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String _name = ref.watch(authProvider).value!.name;
    final String _email = ref.watch(authProvider).value!.email;
    final int _userType = ref.watch(authProvider).value!.userType;

    return Drawer(
      backgroundColor: colorDrawerBG,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30,),
            buildMenuHeader(context, _name, _email, hasProfilePic),
            buildMenuBody(context, _userType),
          ],
        ),
      ),
    );
  }
}
