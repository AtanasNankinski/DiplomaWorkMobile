import 'package:diploma_work_mobile/components/replica_container.dart';
import 'package:diploma_work_mobile/games/player_model.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:flutter/material.dart';

class PlayerListContainer extends StatelessWidget {
  const PlayerListContainer({Key? key, required this.player, required this.onTap}) : super(key: key);

  final Player player;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        margin: const EdgeInsets.only(top: 6, bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: _determineBGColor(player.replica.replicaPower),
          border: Border.all(
            width: 1,
            color: _determineBorderColor(player.team),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                player.user,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
            Container(
              width: 80,
              height: 20,
              margin: const EdgeInsets.only(bottom: 6, left: 6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        _determineIcon(_convertReplicaType(player.replica.replicaType)),
                      ),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ],
        ),
      ),
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
      return colorPlayerBoxBG;
    }else if(power <= 1.3) {
      return colorPlayerBoxGreen;
    }else if(power > 1.3 && power <= 1.7) {
      return colorPlayerBoxYellow;
    }else {
      return colorPlayerBoxRed;
    }
  }

  Color _determineBorderColor(int team) {
    switch(team) {
      case 1:
        return Colors.transparent;
      case 2:
        return colorTextRed;
      case 3:
        return colorTextBlue;
      default:
        return Colors.transparent;
    }
  }
}
