import 'package:auto_route/auto_route.dart';
import 'package:study_msg/app/app.dart';
import 'package:study_msg/ui/features/home/home.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: App.navigatorGlobalKey);

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
