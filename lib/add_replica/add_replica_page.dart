import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/components/text_inputs/default_input.dart';
import 'package:diploma_work_mobile/components/buttons/primary_button.dart';
import 'package:diploma_work_mobile/components/replica_container.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/add_replica/replica_providers.dart';
import 'package:diploma_work_mobile/components/buttons/primary_dropdown_button.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';

class AddReplicaPage extends ConsumerWidget {
  AddReplicaPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController powerController = TextEditingController();

  final List<String> dropDownOptions = const ["Pistol", "SMG", "Assault Rifle", "Sniper"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String errorText = ref.watch(addReplicaPageProvider);
    final int userId = ref.watch(userProvider).value!.id!;
    final errorTextState = ref.read(addReplicaPageProvider.notifier);

    final Map<String, Object>? replicaData = ModalRoute.of(context)?.settings.arguments as Map<String, Object>?;
    final bool isEditing = replicaData?["is_editing"] as bool? ?? false;
    final String name = replicaData?['replica_name'] as String? ?? "";
    _editInitializeData(name, isEditing,  ref);

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
            enabled: !isEditing,
            onChanged: (value) {
              if(value.length < 10){
                ref.read(addReplicaNameProvider.notifier).state = value;
                errorTextState.clearErrorMessage();
              }else {
                errorTextState.setErrorMessage("Replica name is too long.");
              }
            },
          ),
          DefaultInputField(
            controller: powerController,
            inputType: TextFieldType.text,
            hintText: "Replica Power",
            onChanged: (value) {
              if(_isValidDouble(value)){
                ref.read(addReplicaPowerProvider.notifier).state = double.parse(value);
                errorTextState.clearErrorMessage();
              }else {
                errorTextState.setErrorMessage("Invalid replica power value.");
              }
            },
          ),
          PrimaryDropdownButton(
            dropDownOptions: dropDownOptions,
            hint: "Type",
            provider: addReplicaTypeProvider,
          ),
          const Spacer(),
          primaryButton(
            onPressed: (){
              isEditing
                  ? _finalizedEditing(context, ref, userId)
                  : _finalizedNotEditing(context, ref, userId);
            },
            content: "Finalize",
            context: context,
          ),
          Center(
            child: Text(
              errorText,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          sectionSeparator("Preview", context, false),
          const Spacer(),
          Center(
            child: ReplicaContainer(
              replicaName: ref.watch(addReplicaNameProvider),
              replicaType: _convertType(ref.watch(addReplicaTypeProvider)),
              replicaPower: ref.watch(addReplicaPowerProvider),
              hasOptions: false,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  String _convertType(String? type) {
    type ??= "";

    switch(type) {
      case "Pistol":
        return "pistol";
      case "SMG":
        return "smg";
      case "Assault Rifle":
        return "assault_rifle";
      case "Sniper":
        return "sniper";
      default:
        return "";
    }
  }

  bool _isValidDouble(String value) {
    if(double.tryParse(value) != null){
      if(double.parse(value) <= 10.0){
        return true;
      }
    }
    return false;
  }

  void _editInitializeData(String name, bool isEditing, WidgetRef ref) {
    if(isEditing) {
      nameController.text = name;

      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(addReplicaNameProvider.notifier).state = name;
      });
    }
  }

  void _finalizedNotEditing(BuildContext context, WidgetRef ref, int userId) {
    String name = ref.watch(addReplicaNameProvider);
    String type = _convertType(ref.watch(addReplicaTypeProvider));
    double power = ref.watch(addReplicaPowerProvider);
    if(ref.read(addReplicaPageProvider.notifier).validateFields(name, type, power, userId)){
      ref.read(replicaProvider.notifier).createReplica(name,type, power, userId);
      Navigator.pop(context);
    }
  }

  void _finalizedEditing(BuildContext context, WidgetRef ref, int userId) {
    String name = ref.watch(addReplicaNameProvider);
    String type = _convertType(ref.watch(addReplicaTypeProvider));
    double power = ref.watch(addReplicaPowerProvider);
    if(ref.read(addReplicaPageProvider.notifier).validateFields(name, type, power, userId)){
      ref.read(replicaProvider.notifier).editReplica(name,type, power, userId);
      Navigator.pop(context);
    }
  }
}