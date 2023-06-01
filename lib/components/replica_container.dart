import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:flutter/material.dart';

class ReplicaContainer extends StatelessWidget {
  const ReplicaContainer({Key? key, required this.replicaName, required this.replicaType, required this.replicaPower}) : super(key: key);

  final String replicaName;
  final ReplicaType replicaType;
  final double replicaPower;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 100,
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: colorReplicaBoxBG,
        border: Border.all(
            color: determineBorderColor(replicaPower),
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
                  margin: EdgeInsets.only(left: 12),
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
                  constraints: BoxConstraints(),
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
                        determineIcon(replicaType),
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

  Color determineBorderColor(double power){
    if(power <= 1.3) {
      return colorReplicaBoxGreen;
    }else if(power > 1.3 && power <= 1.7) {
      return colorReplicaBoxYellow;
    }else {
      return colorReplicaBoxRed;
    }
  }

  String determineIcon(ReplicaType replicaType){
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
}

enum ReplicaType{
  pistol,
  smg,
  assaultRifle,
  sniper,
}
