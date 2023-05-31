import 'package:diploma_work_mobile/components/buttons/error_button.dart';
import 'package:diploma_work_mobile/error/error_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/util/colors.dart';

class ErrorDialog extends ConsumerWidget {
  const ErrorDialog({Key? key, required this.title, required this.errorContent}) : super(key: key);

  final String title;
  final String errorContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readState = ref.read(errorProvider.notifier);

    return SizedBox.expand(
      child: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.black.withOpacity(0.8),
        child: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: colorTextDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10,),
                Text(
                  errorContent,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: colorTextDark,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20,),
                errorButton(
                  context: context,
                  onPressed: () {
                    readState.disbandError();
                  },
                ),
              ]
            ),
          ),
        )
      ),
    );
  }
}
