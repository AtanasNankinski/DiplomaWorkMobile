import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/components/buttons/primary_button.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePageWidget(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Column(
          children: [
            const Center(
              child: Text("Dashboard Page"),
            ),
            primaryButton(
              onPressed: (){
                ref.read(authProvider.notifier).logout();
              },
              content: "Logout",
              context: context,
            )
          ]
        ),
      ),
      title: "Dashboard",
    );
  }
}
