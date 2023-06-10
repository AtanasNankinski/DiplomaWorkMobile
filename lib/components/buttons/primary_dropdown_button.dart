import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

class PrimaryDropdownButton extends ConsumerWidget {
  const PrimaryDropdownButton({Key? key, required this.dropDownOptions, required this.hint, required this.provider}) : super(key: key);

  final List<String> dropDownOptions;
  final String hint;
  final AutoDisposeStateProvider<String?> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 16),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Text(
                hint,
              ),
              value: ref.watch(provider),
              isExpanded: true,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: colorTextInputField,
              ),
              items: dropDownOptions.map((item) =>
                  DropdownMenuItem(value: item, child: Text(item)),
              ).toList(),
              onChanged: (value){
                ref.read(provider.notifier).state = value.toString();
              },
            ),
          ),
        ),
      ),
    );
  }
}