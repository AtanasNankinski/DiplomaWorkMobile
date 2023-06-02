import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      hasDrawer: false,
      title: "Admin Panel",
      child: Center(
          child: Text("Admin Panel")
      ),
    );
  }
}
