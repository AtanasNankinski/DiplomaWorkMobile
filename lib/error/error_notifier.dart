import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/error/error.dart';

class ErrorNotifier extends StateNotifier<ErrorModel>{
  ErrorNotifier() : super(ErrorModel(showError: false, exception: '', errorTitle: ''));

  void createException({
    required String exception,
    required String errorTitle
  }){
    state = state.update(showError: true, exception: exception, errorTitle: errorTitle);
  }

  void disbandError() {
    state = state.update(showError: false);
  }
}