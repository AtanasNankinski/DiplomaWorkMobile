import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddReplicaNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void setErrorMessage(String error){
    state = error;
  }

  void clearErrorMessage() {
    state = "";
  }

  bool validateFields(String name, String type, double power, int? userId) {
    if(userId == null) {
      ref.read(errorProvider.notifier).createException(exception: "User error in action.", errorTitle: "User Error");
      return false;
    }

    if(name.isNotEmpty && type.isNotEmpty && power <= 10 && power > 0){
      return true;
    }
    setErrorMessage("There are empty fields or wrong data.");
    return false;
  }
}