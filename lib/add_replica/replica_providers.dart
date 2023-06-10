import 'package:diploma_work_mobile/add_replica/add_replica_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/add_replica/replica_notifier.dart';
import 'package:diploma_work_mobile/add_replica/replica_model.dart';

final replicaProvider = AsyncNotifierProvider<ReplicaNotifier, List<Replica>>(
      () => ReplicaNotifier(),
);

final addReplicaNameProvider = StateProvider.autoDispose<String>(
      (ref) => "",
);

final addReplicaTypeProvider = StateProvider.autoDispose<String?>(
      (ref) => null,
);

final addReplicaPowerProvider = StateProvider.autoDispose<double>(
      (ref) => 0,
);

final addReplicaPageProvider = NotifierProvider<AddReplicaNotifier, String>(
    () => AddReplicaNotifier()
);