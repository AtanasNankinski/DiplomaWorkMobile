import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void setErrorMessage({required String errorMessage}) {
    state = errorMessage;
  }

  bool validateNameFields(String firstName, String lastName) {
    if(firstName != "" && lastName != ""){
      setErrorMessage(errorMessage: "");
      return true;
    }else {
      setErrorMessage(errorMessage: "There are empty fields.");
      return false;
    }
  }
}