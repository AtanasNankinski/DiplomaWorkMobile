import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/login_model.dart';

class LoginNotifier extends Notifier<LoginModel>{
  @override
  LoginModel build() {
    return LoginModel(email: "", password: "", errorText: "");
  }

  void updateData({
    required String email,
    required String password,
  }){
    state = state.update(email: email, password: password);
  }

  void setErrorMessage({required String errorMessage}) {
    state = state.update(errorText: errorMessage);
  }

  bool checkEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  void validateData() {
    if(state.email != "" && state.password != ""){
      if(checkEmail(state.email)){
        setErrorMessage(errorMessage: "");
      }else {
        setErrorMessage(errorMessage: "Email is in wrong format");
      }
    }else {
      setErrorMessage(errorMessage: "There are empty fields");
    }
  }
}