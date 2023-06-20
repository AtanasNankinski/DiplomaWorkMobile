import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/game_details/past_game_details_screen/past_overview_screen.dart';
import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';

class PastGameDetailsPage extends ConsumerStatefulWidget {
  const PastGameDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PastGameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends ConsumerState<PastGameDetailsPage>{
  @override
  Widget build(BuildContext context) {
    final PastGame game = ModalRoute.of(context)!.settings.arguments as PastGame;

    return BasePageWidget(
      title: "Game Details",
      hasDrawer: false,
      hasPadding: false,
      child: PastOverviewScreen(game: game,),
    );
  }
}
