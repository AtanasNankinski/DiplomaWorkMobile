import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/login_model.dart';
import 'package:diploma_work_mobile/auth/login_notifier.dart';

final loginProvider = StateNotifierProvider.autoDispose<LoginNotifier, LoginModel>(
      (ref) => LoginNotifier(),
);