import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/misc/util/colors.dart';

class ReplicaContainer extends StatelessWidget {
  const ReplicaContainer({Key? key, required this.replicaName, required this.replicaType, required this.replicaPower}) : super(key: key);

  final String replicaName;
  final String replicaType;
  final double replicaPower;

  @override
  Widget build(BuildContext context) {
    final ReplicaType convertedType = _convertReplicaType(replicaType);

    return Container(
      width: 140,
      height: 100,
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: colorReplicaBoxBG,
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
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.more_vert),
                  splashRadius: 1,
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerRight,
                ),
              )
            ],
          ),
          Center(
            child: Container(
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
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Power: ${replicaPower}J",
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
    if(power <= 1.3) {
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
        return ReplicaType.assaultRifle;
    }
  }
}

enum ReplicaType{
  pistol,
  smg,
  assaultRifle,
  sniper,
}
