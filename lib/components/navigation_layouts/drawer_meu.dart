import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/theme/theme_colors.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({Key? key}) : super(key: key);

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
            buildMenuHeader(_name, _email),
            buildMenuBody(),
          ]
        ),
      ),
    );
  }

  Widget buildMenuHeader(String name, String email) {
    return Container(
      child: Text("Header"),
    );
  }

  Widget buildMenuBody() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.dashboard, color: Colors.white,),
          title: Text("Dashboard"),
          onTap: (){

          },
        )
      ],
    );
  }
}
