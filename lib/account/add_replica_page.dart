import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';

class AddReplicaPage extends ConsumerWidget {
  const AddReplicaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePageWidget(
      hasDrawer: false,
      title: "Add Replica",
      child: Center(
        child: Text("Add Replica"),
      ),
    );
  }
}
