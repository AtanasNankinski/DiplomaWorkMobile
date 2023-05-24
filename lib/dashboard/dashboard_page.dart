import 'package:diploma_work_mobile/components/base_page_widget.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      child: Center(
        child: Text("Dashboard Page"),
      ),
      title: "Dashboard",
    );
  }
}
