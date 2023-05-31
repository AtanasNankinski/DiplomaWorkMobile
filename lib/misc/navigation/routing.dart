import 'package:diploma_work_mobile/account/account_page.dart';
import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/control_widget/control_widget.dart';
import 'package:diploma_work_mobile/misc/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/auth/login/login_page.dart';
import 'package:diploma_work_mobile/auth/register/register_page.dart';
import 'package:diploma_work_mobile/admin_panel/admin_panel_page.dart';
import 'package:diploma_work_mobile/games/games_page.dart';
import 'package:diploma_work_mobile/score/score_page.dart';
import 'package:diploma_work_mobile/settings/settings_page.dart';

class Routing {
  /// Static method used for pushing the routes that are being called from the ui.
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutingConst.defaultRoute:
        return MaterialPageRoute(
          builder: (context) => const ControlWidget(),
          settings: settings,
        );
      case RoutingConst.loginRoute:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
          settings: settings,
        );
      case RoutingConst.registerRoute:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
          settings: settings,
        );
      case RoutingConst.accountRoute:
        return MaterialPageRoute(
          builder: (context) => AccountPage(),
          settings: settings,
        );
      case RoutingConst.gamesRoute:
        return MaterialPageRoute(
          builder: (context) => GamesPage(),
          settings: settings,
        );
      case RoutingConst.adminPanelRoute:
        return MaterialPageRoute(
          builder: (context) => AdminPanelPage(),
          settings: settings,
        );
      case RoutingConst.scoreRoute:
        return MaterialPageRoute(
          builder: (context) => ScorePage(),
          settings: settings,
        );
      case RoutingConst.settingsRoute:
        return MaterialPageRoute(
          builder: (context) => SettingsPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ControlWidget(),
          settings: settings,
        );
    }
  }
}