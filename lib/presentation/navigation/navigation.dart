import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

part 'navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
}
