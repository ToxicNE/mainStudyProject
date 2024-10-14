import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:study_msg/data/ds/auth/auth_ds.dart';
import 'package:study_msg/data/ds/auth/auth_mds.dart';
import 'package:study_msg/data/ds/auth/auth_rds.dart';
import 'package:study_msg/di/app_async_dependency.dart';
import 'package:study_msg/domain/auth_repository/auth_repository.dart';
import 'package:study_msg/ui/theme/theme.dart';
import 'package:study_msg/navigation/app_router.dart';

class GlobalDep extends AppAsyncDependency {
  late AppThemeData theme = SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light
      ? AppThemeData.light()
      : AppThemeData.dark();

  late final AppRouter router;

  late final AuthRepository authRepository;

  late final IAuthDS _authDS;

  @override
  Future<void> initAsync(BuildContext context) async {
    _initMockDS();

    authRepository = AuthRepository(_authDS);

    router = AppRouter();
  }

  void _initMockDS() {
    _authDS = AuthMDS();
  }

  // ignore: unused_element
  void _initRDS() {
    _authDS = AuthRDS();
  }

  @override
  Future<void> onError(BuildContext context) async {}
}

extension GLobalDepExt on BuildContext {
  GlobalDep get global => read<GlobalDep>();
}
