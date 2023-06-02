import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      hasDrawer: true,
      title: "Score",
      child: Center(
        child: Text("Score"),
      ),
    );
  }
}