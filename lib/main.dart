import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/theme/theme.dart';
import 'package:diploma_work_mobile/navigation/routing.dart';
import 'package:diploma_work_mobile/navigation/routing_constants.dart';
import 'package:diploma_work_mobile/control_widget/control_widget.dart';
import 'package:diploma_work_mobile/util_services/shared_preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SharedPreferencesService().setup();

  runApp(
    const ProviderScope(
      child: MyApp()
    ),
  );

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airsoft Kings Mobile',
      onGenerateRoute: Routing.generateRoute,
      initialRoute: RoutingConst.defaultRoute,
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      home: const ControlWidget(),
    );
  }
}
