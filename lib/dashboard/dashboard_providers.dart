import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/dashboard/score_model.dart';
import 'package:diploma_work_mobile/dashboard/dashboard_notifier.dart';

final dashboardProvider = AsyncNotifierProvider<DashboardNotifier, Score>(
    () => DashboardNotifier()
);