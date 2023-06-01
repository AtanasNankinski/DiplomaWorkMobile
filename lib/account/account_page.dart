import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/components/default_avatar.dart';
import 'package:diploma_work_mobile/components/buttons/primary_outlined_button.dart';
import 'package:diploma_work_mobile/components/text_inputs/default_input.dart';
import 'package:diploma_work_mobile/account/replica_model.dart';
import 'package:diploma_work_mobile/components/add_replica_container.dart';
import 'package:diploma_work_mobile/components/replica_container.dart';

class AccountPage extends ConsumerWidget {
  AccountPage({Key? key}) : super(key: key);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final List<Replica> mockedReplicas = [
    const Replica(replicaName: "Shcmaizer", replicaType: ReplicaType.smg, replicaPower: 1.3),
    const Replica(replicaName: "Bareta", replicaType: ReplicaType.pistol, replicaPower: 1.7),
    const Replica(replicaName: "Sniper", replicaType: ReplicaType.sniper, replicaPower: 2.3),
    const Replica(replicaName: "Rifle", replicaType: ReplicaType.assaultRifle, replicaPower: 1.7),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String username = "";

    ref.watch(authProvider).whenData((value) => {
      username = value.name
    });

    return BasePageWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sectionSeparator("Avatar", context, true),
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: defaultAvatar(context: context, size: AvatarSizes.big, username: username, background: Colors.yellow),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: primaryOutlinedButton(
              context: context,
              buttonText: "Change Avatar",
              onPressed: (){

              },
            ),
          ),
          sectionSeparator("Name", context, false),
          DefaultInputField(controller: firstNameController, inputType: TextFieldType.text, hintText: "First Name",),
          Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: DefaultInputField(controller: lastNameController, inputType: TextFieldType.text, hintText: "Last Name",)
          ),
          primaryOutlinedButton(
            context: context,
            buttonText: "Change Name",
            onPressed: (){

            },
          ),
          sectionSeparator("Replicas", context, false),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for(var replica in mockedReplicas)
                ReplicaContainer(
                  replicaName: replica.replicaName,
                  replicaType: replica.replicaType,
                  replicaPower: replica.replicaPower,
              ),
              addReplicaContainer(
                context: context,
                onPressed: (){

                },
              ),
            ],
          ),
        ]
      ),
      title: "Account",
    );
  }
}