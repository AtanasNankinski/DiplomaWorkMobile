import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/util/colors.dart';
import 'package:diploma_work_mobile/components/separator.dart';

Widget buildMenuBody(BuildContext context, int userType) {
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

        },
      ),
      ListTile(
        minLeadingWidth: 12,
        leading: Icon(Icons.list_alt, color: colorMenuIcons,),
        title: Text(
          "Score",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        onTap: (){

        },
      ),
      userType == 1
          ? ListTile(
              minLeadingWidth: 12,
              leading: Icon(Icons.admin_panel_settings_outlined, color: colorMenuIcons,),
              title: Text(
                "Admin Panel",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: (){

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