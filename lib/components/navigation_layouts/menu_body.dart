import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/misc/util/colors.dart';
import 'package:diploma_work_mobile/components/separator.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/dashboard/dashboard_providers.dart';

class BuildMenuBody extends ConsumerWidget {
  const BuildMenuBody({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          minLeadingWidth: 12,
          leading: Icon(Icons.dashboard, color: colorMenuIcons,),
          title: Text(
            "Dashboard",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onTap: (){
            Navigator.pushNamed(context, RoutingConst.dashboardRoute);
            ref.read(dashboardProvider.notifier).getScore(user.id!);
          },
        ),
        ListTile(
          minLeadingWidth: 12,
          leading: Icon(Icons.games_outlined, color: colorMenuIcons,),
          title: Text(
            "Games",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onTap: (){
            Navigator.pushNamed(context, RoutingConst.gamesRoute);
          },
        ),
        user.userType == 1
            ? ListTile(
          minLeadingWidth: 12,
          leading: Icon(Icons.admin_panel_settings_outlined, color: colorMenuIcons,),
          title: Text(
            "Admin Panel",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onTap: (){
            Navigator.pushNamed(context, RoutingConst.adminPanelRoute);
          },
        )
            : Container(),
        separator(),
        ListTile(
          minLeadingWidth: 12,
          leading: Icon(Icons.settings, color: colorMenuIcons,),
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onTap: (){
            Navigator.pushNamed(context, RoutingConst.settingsRoute);
          },
        ),
        ListTile(
          minLeadingWidth: 12,
          leading: Icon(Icons.help, color: colorMenuIcons,),
          title: Text(
            "Help",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onTap: (){

          },
        ),
        Container(
          margin: EdgeInsets.all(16),
          child: Text(
            "version: 0.0.1",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}