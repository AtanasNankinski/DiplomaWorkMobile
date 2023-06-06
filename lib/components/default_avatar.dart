import 'package:flutter/material.dart';

Widget defaultAvatar({required BuildContext context, required AvatarSizes size, required String username, required String background}) {
  final radius = _getRadius(size);

  return ClipOval(
    child: Container(
      color: _determineAvatarColor(background),
      height: radius*2,
      width: radius*2,
      child: Center(
        child: Text(
          _getUsername(username),
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

String _getUsername(String username){
  if(username.isEmpty){
    return 'P';
  }
  return username[0].toUpperCase();
}

Color _determineAvatarColor(String color) {
  switch(color) {
    case "yellow":
      return Colors.yellow;
    case "orange":
      return Colors.orange;
    case "red":
      return Colors.red;
    case "blue":
      return Colors.lightBlueAccent;
    case "green":
      return Colors.lightGreenAccent;
    default:
      return Colors.yellow;
  }
}

enum AvatarSizes {
  big,
  small,
}