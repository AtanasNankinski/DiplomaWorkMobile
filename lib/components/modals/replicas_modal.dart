import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/add_replica/replica_model.dart';
import 'package:diploma_work_mobile/add_replica/replica_providers.dart';
import 'package:diploma_work_mobile/components/replica_container.dart';
import 'package:diploma_work_mobile/games/games_providers.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';

class ReplicasModal extends ConsumerWidget {
  const ReplicasModal({Key? key, required this.userId, required this.gameId}) : super(key: key);

  final int userId;
  final int gameId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Replica> replicas = [];
    ref.watch(replicaProvider).whenData((value) {
      replicas = value;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for(var replica in replicas)
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              ref.read(playerProvider.notifier).joinGame(userId, replica.replicaId!, gameId);
            },
            child: Container(
              color: _determineBGColor(replica.replicaPower),
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(replica.replicaName),
                  Container(
                    width: 80,
                    height: 20,
                    margin: const EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                _determineIcon(_convertReplicaType(replica.replicaType)),
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }

  String _determineIcon(ReplicaType replicaType){
    switch(replicaType){
      case ReplicaType.pistol:
        return 'assets/icon_pistol.png';
      case ReplicaType.smg:
        return 'assets/icon_smg.png';
      case ReplicaType.assaultRifle:
        return 'assets/icon_assault_rifle.png';
      case ReplicaType.sniper:
        return 'assets/icon_sniper_trimmed.png';
      case ReplicaType.empty:
        return '';

    }
  }

  ReplicaType _convertReplicaType(String type){
    switch(type) {
      case "pistol":
        return ReplicaType.pistol;
      case "smg":
        return ReplicaType.smg;
      case "assault_rifle":
        return ReplicaType.assaultRifle;
      case "sniper":
        return ReplicaType.sniper;
      default:
        return ReplicaType.empty;
    }
  }

  Color _determineBGColor(double power){
    if(power == 0) {
      return colorAddReplicaBoxBorder;
    }else if(power <= 1.3) {
      return colorReplicaBoxGreen;
    }else if(power > 1.3 && power <= 1.7) {
      return colorReplicaBoxYellow;
    }else {
      return colorReplicaBoxRed;
    }
  }
}
