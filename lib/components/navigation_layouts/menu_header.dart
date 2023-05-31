import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';
import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/default_avatar.dart';
import 'package:diploma_work_mobile/components/separator.dart';

Widget buildMenuHeader(BuildContext context, String name, String email, bool hasProfilePic) {
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
              child: hasProfilePic
                  ? Container()
                  : defaultAvatar(context: context, size: AvatarSizes.small, username: name, background: Colors.yellow),
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
        name,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      Container(
        margin: EdgeInsets.only(top: 4, bottom: 12),
        child: Text(
          email,
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