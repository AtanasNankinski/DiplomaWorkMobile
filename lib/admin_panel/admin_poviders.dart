import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/admin_panel/admin_panel_notifier.dart';


final adminPanelProvider = NotifierProvider<AdminPanelNotifier, String>(
    () => AdminPanelNotifier()
);