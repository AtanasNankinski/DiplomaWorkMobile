import 'package:flutter/cupertino.dart';

@immutable
class User {
  final int? id;
  final String name;
  final String email;
  final int userType;
  final String accessToken;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    required this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      userType: map['user_type'] as int,
      accessToken: map["access_token"] as String,
    );
  }

  User update({
    int? id,
    String? name,
    String? email,
    int? userType,
    String? accessToken,
  }){
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      userType: userType ?? this.userType,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}