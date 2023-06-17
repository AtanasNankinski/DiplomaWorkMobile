import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/components/text_inputs/add_game_input.dart';
import 'package:diploma_work_mobile/components/buttons/primary_button.dart';
import 'package:diploma_work_mobile/components/validation_error_text.dart';
import 'package:diploma_work_mobile/admin_panel/admin_poviders.dart';

class AdminPanelPage extends ConsumerWidget {
  AdminPanelPage({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateWatch = ref.watch(dateProvider);
    final String day = dateWatch.day.toString();
    final String month = dateWatch.month.toString();
    final String year = dateWatch.year.toString();

    return BasePageWidget(
      hasDrawer: true,
      title: "Admin Panel",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sectionSeparator("Add Game", context, true),
          AddGameInput(
            controller: titleController,
            hintText: "Game Title",
            isBig: false,
            onChanged: (value){},
          ),
          AddGameInput(
            controller: descriptionController,
            hintText: "Game Description",
            isBig: true,
            onChanged: (value){},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("$day/$month/$year"),
              primaryButton(
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: dateWatch,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );

                  if(date == null) {
                    return;
                  }
                  ref.read(dateProvider.notifier).state = date;
                },
                content: "Select Date",
                context: context,
              ),
            ],
          ),
          validationErrorText(context, ref.watch(adminPanelProvider)),
          const Spacer(),
          primaryButton(
            onPressed: (){
              ref.read(adminPanelProvider.notifier).addGame(titleController.text, descriptionController.text, dateWatch, context);
            },
            content: "Add Game",
            context: context,
          )
        ],
      ),
    );
  }
}

final dateProvider = StateProvider.autoDispose<DateTime>(
    (ref) => DateTime.now()
);