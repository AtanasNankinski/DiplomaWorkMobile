import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/register_notifier.dart';
import 'package:diploma_work_mobile/auth/register_model.dart';
import 'package:diploma_work_mobile/auth/login_model.dart';
import 'package:diploma_work_mobile/auth/login_notifier.dart';

final registerProvider = NotifierProvider<RegisterNotifier, RegisterModel>(
      () => RegisterNotifier(),
);

final loginProvider = NotifierProvider<LoginNotifier, LoginModel>(
      () => LoginNotifier(),
);