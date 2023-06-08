import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/add_replica/replica_notifier.dart';
import 'package:diploma_work_mobile/add_replica/replica_model.dart';

final replicaProvider = AsyncNotifierProvider<ReplicaNotifier, List<Replica>>(
        () => ReplicaNotifier()
);