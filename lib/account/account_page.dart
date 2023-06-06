import 'package:diploma_work_mobile/account/account_providers.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/components/avatar_with_image.dart';
import 'package:diploma_work_mobile/components/image_pick_modal.dart';
import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';
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
    const Replica(replicaName: "Baretta", replicaType: ReplicaType.pistol, replicaPower: 1.7),
    const Replica(replicaName: "Sniper", replicaType: ReplicaType.sniper, replicaPower: 2.3),
    const Replica(replicaName: "Rifle", replicaType: ReplicaType.assaultRifle, replicaPower: 1.7),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(accountPageProvider);
    final accountProviderRead = ref.read(accountPageProvider.notifier);
    final userProviderRead = ref.read(userProvider.notifier);
    final userProviderWatch = ref.watch(userProvider);
    final profileProviderRead = ref.read(profilePicProvider.notifier);
    final profileProviderWatch =  ref.watch(profilePicProvider);

    User user = User.empty();
    String color = "";
    bool hasPicture = false;
    String pictureUrl = "";
    userProviderWatch.whenData((value) {
      user = value;
    });
    profileProviderWatch.whenData((value) {
      if(value.image != "") {
        pictureUrl = value.image;
        hasPicture = true;
      }else {
        hasPicture = false;
        color = value.color;
      }
    });

    return BasePageWidget(
      hasDrawer: true,
      title: "Account",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sectionSeparator("Avatar", context, true),
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: hasPicture
                  ? avatarWithImage(
                      url: pictureUrl,
                      context: context,
                      size: AvatarSizes.big,
                    )
                  : defaultAvatar(
                      context: context,
                      size: AvatarSizes.big,
                      username: user.name,
                      background: color,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: primaryOutlinedButton(
              context: context,
              buttonText: "Change Avatar",
              onPressed: (){
                showModalBottomSheet(context: context, builder: (context) {
                  return imagePickModal(
                    onPressedImage: () {
                      if(user.id != null) {
                        profileProviderRead.changeAvatarFromGallery(user.id!, context);
                      }
                    },
                    onPressedGallery: () {

                    },
                  );
                });
              },
            ),
          ),
          sectionSeparator("Name", context, false),
          DefaultInputField(controller: firstNameController, inputType: TextFieldType.text, hintText: "First Name",),
          Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: DefaultInputField(controller: lastNameController, inputType: TextFieldType.text, hintText: "Last Name",)
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
          primaryOutlinedButton(
            context: context,
            buttonText: "Change Name",
            onPressed: (){
              if(accountProviderRead.validateNameFields(firstNameController.text, lastNameController.text)){
                String fullName = "${firstNameController.text} ${lastNameController.text}";
                userProviderRead.updateUsername(fullName);
                firstNameController.text = "";
                lastNameController.text = "";
              }
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
                  Navigator.pushNamed(context, RoutingConst.addReplicaRoute);
                },
              ),
            ],
          ),
        ]
      ),
    );
  }
}