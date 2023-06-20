import 'package:diploma_work_mobile/components/last_game_card.dart';
import 'package:diploma_work_mobile/components/personal_score_card.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/dashboard/dashboard_providers.dart';
import 'package:diploma_work_mobile/dashboard/score_model.dart';
import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/components/buttons/primary_button.dart';
import 'package:diploma_work_mobile/account/account_providers.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:diploma_work_mobile/components/account_card.dart';
import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String _name = ref.watch(userProvider).value!.name;
    final int _id = ref.watch(userProvider).value!.id!;

    String pictureUrl = "";
    String color = "";

    ref.watch(profilePicProvider).whenData((value) {
      if(value.image != "") {
        pictureUrl = value.image;
        color = "";
      }else {
        pictureUrl = "";
        color = value.color;
      }
    });

    Score score = Score.empty();
    ref.watch(dashboardProvider).whenData((value) {
      score = value;
    });

    return BasePageWidget(
      hasDrawer: true,
      title: "Dashboard",
      onRefresh: () async {
        ref.read(dashboardProvider.notifier).getScore(_id);
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Column(
          children: [
            AccountCard(
              name: _name,
              pictureUrl: pictureUrl,
              color: color,
              onTap: () {
                Navigator.pushNamed(context, RoutingConst.accountRoute);
              },
            ),
            LastGameCard(score: score,),
            PersonalScoreCard(score: score,),
            sectionSeparator("Logout", context, false),
            primaryButton(
              onPressed: (){
                ref.read(userProvider.notifier).logout(context);
              },
              content: "Logout",
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  String _determineTeam(PastGame? game) {
    if(game == null) return "N/A";

    switch(game.team) {
      case 2:
        return "Red";
      case 3:
        return "Blue";
      default:
        return "N/A";
    }
  }

  String _determineResult(PastGame? lastGame, int? lastTeam) {
    if(lastGame == null || lastTeam == null) {
      return "N/A";
    }

    if(lastGame.team == lastTeam) {
      return "Victory";
    }
    return "Defeat";
  }

  Color _determineTeamColor(int? lastTeam) {
    if(lastTeam == null) return colorTextNeutral;

    switch(lastTeam) {
      case 2:
        return colorTextRed;
      case 3:
        return colorTextBlue;
      default:
        return colorTextNeutral;
    }
  }

  Color _determineOutcomeColor(PastGame? lastGame, int? lastTeam) {
    if(lastGame == null || lastTeam == null) {
      return colorTextNeutral;
    }

    if(lastGame.team == lastTeam) {
      return colorVictoryGreen;
    }
    return colorTextRed;
  }

  String _getLastGameDate(PastGame? lastGame) {
    if(lastGame == null) {
      return "N/A";
    }

    return lastGame.date;
  }
}
