import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/base_page_nobar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePageNoBarWidget(
      child: Center(
        child: Text("Login Page"),
      ),
    );
  }
}
