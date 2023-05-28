import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/register_notifier.dart';
import 'package:diploma_work_mobile/auth/register_model.dart';

final registerProvider = StateNotifierProvider.autoDispose<RegisterNotifier, RegisterModel>(
      (ref) => RegisterNotifier(),
);

final passwordFieldObscureProviderMain = StateProvider.autoDispose<bool>(
      (ref) => true,
);