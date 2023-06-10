import 'package:diploma_work_mobile/add_replica/replica_providers.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';

class ReplicaContainer extends ConsumerWidget {
  const ReplicaContainer({Key? key, required this.replicaName, required this.replicaType, required this.replicaPower, required this.hasOptions}) : super(key: key);

  final String replicaName;
  final String replicaType;
  final double replicaPower;
  final bool hasOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ReplicaType convertedType = _convertReplicaType(replicaType);
    final int userId = ref.watch(userProvider).value!.id!;

    return Container(
      width: 140,
      height: 100,
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: replicaPower != 0 ? colorReplicaBoxBG : colorAddReplicaBoxBG,
        border: Border.all(
            color: _determineBorderColor(replicaPower),
            width: 2
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Text(
                    replicaName,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: colorTextDark,
                        fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3),
                child: hasOptions
                    ? PopupMenuButton(
                        splashRadius: 1,
                        padding: const EdgeInsets.all(0),
                        child: const Icon(Icons.more_vert),
                        elevation: 0,
                        itemBuilder: (BuildContext context){
                          return [
                            const PopupMenuItem(
                              child: Text("Delete"),
                              value: _MenuItems.delete,
                            ),
                            const PopupMenuItem(
                              child: Text("Edit"),
                              value: _MenuItems.edit,
                            ),
                          ];
                        },
                        onSelected: (value){
                          switch(value) {
                            case _MenuItems.delete:
                              ref.read(replicaProvider.notifier).deleteReplica(replicaName, userId);
                              break;
                            case _MenuItems.edit:
                              Navigator.pushNamed(
                                context,
                                RoutingConst.addReplicaRoute,
                                arguments: {
                                  'replica_name':replicaName,
                                  'is_editing':true,
                                },
                              );
                          }
                        },
                      )
                    : Container(),
              )
            ],
          ),
          Center(
            child: convertedType != ReplicaType.empty
                ? Container(
                    width: 80,
                    height: 20,
                    margin: const EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              _determineIcon(convertedType),
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                  )
                : Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Power: ${replicaPower != 0 ? replicaPower : ""}J",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: colorTextDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _determineBorderColor(double power){
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
}

enum ReplicaType{
  pistol,
  smg,
  assaultRifle,
  sniper,
  empty
}

enum _MenuItems {
  delete,
  edit
}
