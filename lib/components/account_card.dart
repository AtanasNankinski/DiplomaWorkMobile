import 'package:diploma_work_mobile/components/avatar_with_image.dart';
import 'package:diploma_work_mobile/components/default_avatar.dart';
import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key? key,
    required this.name,
    required this.pictureUrl,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String pictureUrl;
  final String color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.only(bottom: 30),
        decoration: const BoxDecoration(
          color: colorAccountCardBG,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Row(
            children: [
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
                        username: name,
                        background: color,
                      ),
              ),
              const SizedBox(width: 25,),
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]
        ),
      ),
    );
  }
}
