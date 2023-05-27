import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/register_model.dart';

class RegisterNotifier extends StateNotifier<RegisterModel>{
  RegisterNotifier() : super(RegisterModel(email: "", password: "", confirmPassword: "", errorText: ""));

  void updateData({
    required String email,
    required String password,
    required String confirmPassword,
  }){
    state = state.update(email: email, password: password, confirmPassword: confirmPassword);
  }

  void setErrorMessage({required String errorMessage}) {
    state = state.update(errorText: errorMessage);
  }

  bool checkEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  void validateData() {
    if(state.email != "" && state.password != "" && state.confirmPassword != ""){
      if(checkEmail(state.email)){
        if(state.password.length >= 8){
          if(state.password == state.confirmPassword){
            setErrorMessage(errorMessage: "");
          }else {
            setErrorMessage(errorMessage: "Password and Confirm Password don't match");
          }
        }else {
          setErrorMessage(errorMessage: "Password should be at least 8 characters");
        }
      }else {
        setErrorMessage(errorMessage: "Email is in wrong format");
      }
    }else {
      setErrorMessage(errorMessage: "There are empty fields");
    }
  }
}