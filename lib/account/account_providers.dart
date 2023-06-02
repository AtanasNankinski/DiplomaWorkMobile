import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/account/account_notifier.dart';

final accountPageProvider = NotifierProvider<AccountNotifier, String>(
    () => AccountNotifier(),
);