import 'package:diploma_work_mobile/components/buttons/primary_button.dart';
import 'package:diploma_work_mobile/components/replica_container.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/components/text_inputs/default_input.dart';

class AddReplicaPage extends ConsumerWidget {
  AddReplicaPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController powerController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePageWidget(
      hasDrawer: false,
      title: "Add Replica",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DefaultInputField(
            controller: nameController,
            inputType: TextFieldType.text,
            hintText: "Replica Name",
          ),
          DefaultInputField(
            controller: powerController,
            inputType: TextFieldType.text,
            hintText: "Replica Power",
          ),
          primaryButton(
            onPressed: (){

            },
            content: "Finalize",
            context: context,
          ),
          sectionSeparator("Preview", context, false),
          const Spacer(),
          Center(
            child: const ReplicaContainer(
              replicaName: "preview",
              replicaType: "assault_rifle",
              replicaPower: 1.7,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
