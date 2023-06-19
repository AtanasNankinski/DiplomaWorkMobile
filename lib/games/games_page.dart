import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/components/base_layouts/base_page_widget.dart';
import 'package:diploma_work_mobile/games/game_screens/active_games_screen.dart';
import 'package:diploma_work_mobile/games/game_screens/past_games_screen.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';

class GamesPage extends ConsumerStatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends ConsumerState<GamesPage> with TickerProviderStateMixin {
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
    return BasePageWidget(
      hasDrawer: true,
      title: "Games",
      hasPadding: false,
      child: Column(
        children: [
          Container(
            color: colorTabBarMain,
            child: TabBar(
              onTap: (index) {
                switch(index) {
                  case 0:
                    ref.read(tabsProvider.notifier).state = TabOptions.active;
                    break;
                  case 1:
                    ref.read(tabsProvider.notifier).state = TabOptions.past;
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
                    "Active",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Tab(
                  child: Text(
                    "Past",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
          Builder(builder: (_) {
            switch(ref.watch(tabsProvider)) {
              case TabOptions.active:
                return const ActiveGamesScreen();
              case TabOptions.past:
                return const PastGamesScreen();
            }
          }),
        ],
      ),
    );
  }
}

final tabsProvider = StateProvider.autoDispose<TabOptions>(
      (ref) => TabOptions.active,
);

enum TabOptions {
  active,
  past,
}