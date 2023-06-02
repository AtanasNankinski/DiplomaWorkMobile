import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/misc/error/error.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:diploma_work_mobile/components/error_dialog.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:diploma_work_mobile/components/navigation_layouts/drawer_menu.dart';
import 'package:diploma_work_mobile/misc/util_services/loading_provider.dart';
import 'package:diploma_work_mobile/components/loading_widget.dart';


class BasePageWidget extends ConsumerWidget {
  final Widget child;
  final String title;
  final bool hasDrawer;

  const BasePageWidget({required this.child, required this.title, required this.hasDrawer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ErrorModel errorState = ref.watch(errorProvider);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/pages_background.png'
          ),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        drawer: hasDrawer ? DrawerMenu() : null,
        appBar: AppBar(
          backgroundColor: colorAppBarBG,
          leading: hasDrawer
              ? null
              : IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  splashRadius: 20,
                ),
          actions: [
            IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.notifications),
              splashRadius: 20,
            )
          ],
          title: Center(
            child: Text(
              title
            ),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
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
                        ref.watch(isLoadingProvider)
                            ? loadingWidget()
                            : Container(),
                      ]
                    )
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
