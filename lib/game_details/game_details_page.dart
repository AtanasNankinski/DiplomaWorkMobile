import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/game_details/game_details_screen/overview_screen.dart';
import 'package:diploma_work_mobile/game_details/game_details_screen/player_list_screen.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:diploma_work_mobile/game_details/game_details_providers.dart';
import 'package:diploma_work_mobile/games/game_model.dart';

class GameDetailsPage extends ConsumerStatefulWidget {
  const GameDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends ConsumerState<GameDetailsPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Game game = ModalRoute.of(context)!.settings.arguments as Game;

    return BasePageWidget(
      title: "Game Details",
      hasDrawer: false,
      hasPadding: false,
      child: Column(
        children: [
          Container(
            color: colorTabBarMain,
            child: TabBar(
              onTap: (index) {
                switch(index) {
                  case 0:
                    ref.read(_tabsProvider.notifier).state = _TabOptions.overview;
                    break;
                  case 1:
                    ref.read(playerListProvider.notifier).getPlayers(game.id!);
                    ref.read(_tabsProvider.notifier).state = _TabOptions.list;
                    break;
                }
              },
              indicator: const BoxDecoration(
                color: colorTabBarSelected,
              ),
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    "Overview",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: colorTextMain),
                  ),
                ),
                Tab(
                  child: Text(
                    "Player List",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: colorTextMain),
                  ),
                )
              ],
            ),
          ),
          Builder(builder: (_) {
            switch(ref.watch(_tabsProvider)) {
              case _TabOptions.overview:
                return OverviewScreen(game: game,);
              case _TabOptions.list:
                return PlayerListScreen(game: game,);
            }
          }),
        ],
      ),
    );
  }

}


final _tabsProvider = StateProvider.autoDispose<_TabOptions>(
      (ref) => _TabOptions.overview,
);

enum _TabOptions {
  overview,
  list
}
