import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/register/register_notifier.dart';
import 'package:diploma_work_mobile/auth/register/register_model.dart';
import 'package:diploma_work_mobile/auth/login/login_model.dart';
import 'package:diploma_work_mobile/auth/login/login_notifier.dart';
import 'package:diploma_work_mobile/auth/auth_notifier.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';

final registerProvider = NotifierProvider<RegisterNotifier, RegisterModel>(
      () => RegisterNotifier(),
);

final loginProvider = NotifierProvider<LoginNotifier, LoginModel>(
      () => LoginNotifier(),
);

final authProvider = AsyncNotifierProvider<AuthNotifier, User>(
      () => AuthNotifier(),
);