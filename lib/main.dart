import 'package:flutter/material.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'router.dart';
import 'services/dialog_service.dart';
import 'services/navigationService.dart';

void main() {
  setupLocator(); //*====registaring get_it
  return runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(),
      // ),);
      MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        builder: (context, child) {
          var dialogService = locator<DialogService>();
          // return DevicePreview.appBuilder(context,child);
          return Navigator(
            key: dialogService.dialogNavigationKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager(child: child)),
          );
        },
         onGenerateRoute: Router.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
        home: Scaffold());
  }
}
