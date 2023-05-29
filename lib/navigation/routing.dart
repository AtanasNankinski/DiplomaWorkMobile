import 'package:flutter/material.dart';

import 'package:diploma_work_mobile/control_widget/control_widget.dart';
import 'package:diploma_work_mobile/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/auth/login/login_page.dart';
import 'package:diploma_work_mobile/auth/register/register_page.dart';

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
      default:
        return MaterialPageRoute(
          builder: (context) => const ControlWidget(),
          settings: settings,
        );
    }
  }
}