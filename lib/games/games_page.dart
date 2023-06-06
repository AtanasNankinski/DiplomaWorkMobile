import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      hasDrawer: true,
      title: "Games",
      child: Center(
        child: Text("Games"),
      ),
    );
  }
}