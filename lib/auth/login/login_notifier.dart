import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends Notifier<String>{
  @override
  String build() {
    return "";
  }

  void setErrorMessage({required String errorMessage}) {
    state = errorMessage;
  }

  bool validateData(String email, String password) {
    if(email != "" && password!= ""){
      if(_checkEmail(email)){
        setErrorMessage(errorMessage: "");
        return true;
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