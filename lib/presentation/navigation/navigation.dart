import 'package:auto_route/auto_route.dart';
import 'package:movies_app/presentation/pages/auth/reset/forgot_password.dart';
import 'package:movies_app/presentation/pages/dashboard/home/home.dart';
import 'package:movies_app/presentation/pages/dashboard/home/widget/detail_movie.dart';
import 'package:movies_app/presentation/pages/dashboard/dashboard.dart';
import 'package:movies_app/presentation/pages/dashboard/account/account.dart';
import 'package:movies_app/presentation/pages/auth/login/login_screens.dart';
import 'package:movies_app/presentation/pages/auth/register/sign_up.dart';
import 'package:movies_app/data/sources/models/movie.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    CustomRoute(
        path: '/dashboard',
        page: DashboardRoute.page,
        initial: true,
        transitionsBuilder: TransitionsBuilders.noTransition,
        children: [
          CustomRoute(
            path: 'home',
            page: DashboardHomeRoute.page,
            initial: true,
            maintainState: false,
            transitionsBuilder: TransitionsBuilders.noTransition,
          ),
          CustomRoute(
            path: 'account',
            page: DashboardAccountRoute.page,
            maintainState: false,
            transitionsBuilder: TransitionsBuilders.noTransition,
          ),
        ]),
    CustomRoute(
      path: '/detail-movie',
      page: DetailMovieRoute.page,
      maintainState: false,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(path: '/sign-in', page: LoginRoute.page),
    CustomRoute(
      path: '/sign-up',
      page: SignupRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      path: '/forgot-password',
      page: ForgotPasswordRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
}
