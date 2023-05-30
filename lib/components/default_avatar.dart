import 'package:flutter/material.dart';

Widget defaultAvatar({required BuildContext context, required AvatarSizes size, required String username, required Color background}) {
  final radius = _getRadius(size);

  return ClipOval(
    child: Container(
      color: Colors.yellow,
      height: radius*2,
      width: radius*2,
      child: Center(
        child: Text(
          username[0].toUpperCase(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black,
            fontSize: _getFontSize(size),
          ),
        ),
      ),
    ),
  );
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

double _getFontSize(AvatarSizes size) {
  if(size == AvatarSizes.small) {
    return 30;
  }else if(size == AvatarSizes.big) {
    return 48;
  }else {
    return 30;
  }
}

enum AvatarSizes {
  big,
  small,
}