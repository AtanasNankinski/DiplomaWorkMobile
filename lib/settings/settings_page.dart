import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      hasDrawer: true,
      title: "Settings",
      child: Center(
        child: Text("Settings"),
      ),
    );
  }
}