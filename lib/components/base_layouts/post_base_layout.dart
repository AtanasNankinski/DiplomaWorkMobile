import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/error/error.dart';
import 'package:diploma_work_mobile/error/error_provider.dart';
import 'package:diploma_work_mobile/components/error_dialog.dart';
import 'package:diploma_work_mobile/components/loading_widget.dart';
import 'package:diploma_work_mobile/util_services/loading_provider.dart';

class PostBaseLayout extends ConsumerWidget {
  final Widget child;

  const PostBaseLayout({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ErrorModel errorState = ref.watch(errorProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: child,
                  ),
                  errorState.showError
                      ? ErrorDialog(title: errorState.errorTitle, errorContent: errorState.exception)
                      : Container(),
                  ref.watch(isLoadingProvider)
                      ? loadingWidget()
                      : Container(),
                ]
              ),
            ),
          ),
        );
      },
    );;
  }
}
