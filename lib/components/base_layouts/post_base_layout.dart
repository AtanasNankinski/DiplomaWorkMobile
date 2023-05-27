import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostBaseLayout extends ConsumerWidget {
  final Widget child;

  const PostBaseLayout({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: child,
              ),
            ),
          ),
        );
      },
    );;
  }
}
