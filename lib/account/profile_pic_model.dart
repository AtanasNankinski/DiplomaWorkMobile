import 'package:flutter/material.dart';

@immutable
class ProfilePicModel {
  final String image;
  final String color;

  ProfilePicModel({
    required this.image,
    required this.color,
  });

  factory ProfilePicModel.fromJson(Map<String, dynamic> map) {
    return ProfilePicModel(
        image: map['image'] as String,
        color: map['color'] as String,
    );
  }

  ProfilePicModel update({String? image, String? color}){
    return ProfilePicModel(
        image: image ?? '',
        color: color ?? '',
    );
  }

  factory ProfilePicModel.empty() {
    return ProfilePicModel(image: "", color: "");
  }
}