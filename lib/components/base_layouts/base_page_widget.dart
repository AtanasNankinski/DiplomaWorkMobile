import 'package:diploma_work_mobile/error/error_dialog.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/error/error.dart';
import 'package:diploma_work_mobile/error/error_provider.dart';


class BasePageWidget extends ConsumerWidget {
  final Widget child;
  final String title;

  const BasePageWidget({required this.child, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ErrorModel errorState = ref.watch(errorProvider);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/PagesBG.png'
          ),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(
            child: Text(
              title
            ),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: child,
                      ),
                      errorState.showError
                          ? ErrorDialog(title: errorState.errorTitle, errorContent: errorState.exception)
                          : Container(),
                    ]
                  )
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
