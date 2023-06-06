import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/account/account_notifier.dart';
import 'package:diploma_work_mobile/account/profile_pic_model.dart';
import 'package:diploma_work_mobile/account/profile_pic_notifier.dart';

final accountPageProvider = NotifierProvider<AccountNotifier, String>(
    () => AccountNotifier(),
);

final profilePicProvider = AsyncNotifierProvider<ProfilePickNotifier, ProfilePicModel>(
    () => ProfilePickNotifier()
);