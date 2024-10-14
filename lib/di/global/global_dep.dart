import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:study_msg/di/app_async_dependency.dart';
import 'package:study_msg/features/theme/theme.dart';
import 'package:study_msg/navigation/app_router.dart';

class GlobalDep extends AppAsyncDependency {
  late AppThemeData theme = SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light
      ? AppThemeData.light()
      : AppThemeData.dark();

  late final AppRouter router;

  @override
  Future<void> initAsync(BuildContext context) async {
    router = AppRouter();
  }

  @override
  Future<void> onError(BuildContext context) async {}
}

extension GLobalDepExt on BuildContext {
  GlobalDep get global => read<GlobalDep>();
}
