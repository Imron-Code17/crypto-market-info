import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../di/di.dart';
import '../presentations/presentations.dart';

part 'router.gr.dart';

AppRouter router = di();

@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: CryptoMarketRoute.page),
        AutoRoute(page: CryptoChartRoute.page),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
}
