import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';

class GameDetailsPage extends ConsumerWidget {
  const GameDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BasePageWidget(
      title: "Game Details",
      hasDrawer: false,
      child: Center(
        child: Text("Game Details Page"),
      ),
    );
  }
}
