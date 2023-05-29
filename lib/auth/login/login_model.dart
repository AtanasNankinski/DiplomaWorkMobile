import 'package:flutter/cupertino.dart';

@immutable
class LoginModel {
  final String email;
  final String password;
  final String errorText;

  LoginModel({
    required this.email,
    required this.password,
    required this.errorText,
  });

  LoginModel update({String? email, String? password, String? errorText}){
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
      errorText: errorText ?? this.errorText,
    );
  }
}