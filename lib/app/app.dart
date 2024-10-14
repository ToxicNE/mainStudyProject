import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:study_msg/di/global/global_dep.dart';
import 'package:study_msg/ui/theme/app_theme.dart';
import 'package:study_msg/ui/theme/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  /// Returns build navigatorState in which the widget with this key (DominosPizzaApp).
  /// You can get build context from navigator state
  /// You can use this build context to get app theme, localization or something related.
  static final navigatorGlobalKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigatorState {
    if (navigatorGlobalKey.currentState == null) {
      throw Exception("can't provide NavigatorState as it isn't created yet or already disposed");
    }
    return navigatorGlobalKey.currentState!;
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final global = context.global;
    return AppTheme(
      data: global.theme,
      child: MaterialApp.router(
        theme: materialThemeFromAppTheme(
          global.theme,
          SchedulerBinding.instance.platformDispatcher.platformBrightness,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: global.router.config(),
      ),
    );
  }
}
