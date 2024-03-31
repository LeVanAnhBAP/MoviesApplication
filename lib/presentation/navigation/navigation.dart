import 'package:auto_route/auto_route.dart';
import 'package:movies_app/presentation/pages/dashboard/home/home.dart';
import 'package:movies_app/presentation/pages/dashboard/home/widget/detail_movie.dart';
import 'package:movies_app/presentation/pages/dashboard/dashboard.dart';
import 'package:movies_app/presentation/pages/dashboard/account/account.dart';
import 'package:movies_app/data/sources/models/movie.dart';

part 'navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
        path: '/dashboard',
        page: DashboardRoute.page,
        initial: true,
        children: [
          AutoRoute(path: 'home', page: DashboardHomeRoute.page, initial: true),
          AutoRoute(path: 'account', page: DashboardAccountRoute.page),
        ]),
    AutoRoute(path: '/detail-movie', page: DetailMovieRoute.page),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
}
