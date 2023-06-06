import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/components/default_avatar.dart';

Widget avatarWithImage({required String url, required BuildContext context, required AvatarSizes size,}) {
  final radius = _getRadius(size);
  try {
    return ClipOval(
      child: Image.network(
        url,
        fit: BoxFit.cover,
        height: radius*2,
        width: radius*2,
      ),
    );
  } catch(e) {
    return ClipOval(
      child: Center(
        child: Image.asset(
          "assets/default_profile_pic.jpg",
          fit: BoxFit.cover,
          height: radius*2,
          width: radius*2,
        ),
      ),
    );
  }
}

double _getRadius(AvatarSizes size) {
  if(size == AvatarSizes.small) {
    return 25;
  }else if(size == AvatarSizes.big) {
    return 40;
  }else {
    return 25;
  }
}