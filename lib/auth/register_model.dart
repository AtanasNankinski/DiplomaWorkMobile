import 'package:flutter/cupertino.dart';

@immutable
class RegisterModel {
  final String email;
  final String password;
  final String confirmPassword;
  final String errorText;

  RegisterModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.errorText,
  });

  RegisterModel update({String? email, String? password, String? confirmPassword, String? errorText}){
    return RegisterModel(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorText: errorText ?? this.errorText,
    );
  }
}