import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/default_avatar.dart';
import 'package:diploma_work_mobile/components/separator.dart';
import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/account/account_providers.dart';
import 'package:diploma_work_mobile/components/avatar_with_image.dart';

class BuildMenuHeader extends ConsumerWidget {
  const BuildMenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String _name = ref.watch(userProvider).value!.name;
    final String _email = ref.watch(userProvider).value!.email;

    String pictureUrl = "";
    String color = "";

    ref.watch(profilePicProvider).whenData((value) {
      if(value.image != "") {
        pictureUrl = value.image;
        color = "";
      }else {
        pictureUrl = "";
        color = value.color;
      }
    });

    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, RoutingConst.accountRoute);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                splashRadius: 20,
              ),
              CircleAvatar(
                radius: 25,
                child: pictureUrl != ""
                    ? avatarWithImage(
                        url: pictureUrl,
                        context: context,
                        size: AvatarSizes.small,
                      )
                    : defaultAvatar(
                        context: context,
                        size: AvatarSizes.small,
                        username: _name,
                        background: color,
                      ),
              ),
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                splashRadius: 20,
              ),
            ]
        ),
        const SizedBox(height: 12,),
        Text(
          _name,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Container(
          margin: EdgeInsets.only(top: 4, bottom: 12),
          child: Text(
            _email,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        separator(),
      ],
    );
  }
}