import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends Notifier<String>{
  @override
  String build() {
    return "";
  }

  void setErrorMessage({required String errorMessage}) {
    state = errorMessage;
  }

  bool validateData(String email, String password, String confirmPass) {
    if(email != "" && password != "" && confirmPass != ""){
      if(_checkEmail(email)){
        if(password.length >= 8){
          if(password == confirmPass){
            setErrorMessage(errorMessage: "");
            return true;
          }else {
            setErrorMessage(errorMessage: "Password and Confirm Password don't match");
            return false;
          }
        }else {
          setErrorMessage(errorMessage: "Password should be at least 8 characters");
          return false;
        }
      }else {
        setErrorMessage(errorMessage: "Email is in wrong format");
        return false;
      }
    }else {
      setErrorMessage(errorMessage: "There are empty fields");
      return false;
    }
  }

  bool _checkEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}