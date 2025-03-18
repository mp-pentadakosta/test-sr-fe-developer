import 'package:auto_route/auto_route.dart';

import '../modules/bottom_nav/bottom_nav_view.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_view.dart';
import '../modules/profile/profile_view.dart';
import '../modules/register/register_view.dart';
import '../modules/splash/splash_view.dart';
import 'wrapper/bottom_nav_wrapper_page.dart';
import 'wrapper/home_wrapper_page.dart';
import 'wrapper/on_board_wrapper_page.dart';
import 'wrapper/profile_wrapper_page.dart';

part 'main_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.noTransition,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnBoardWrapperRoute.page,
          initial: true,
          children: [
            AutoRoute(
              path: SplashView.routeName,
              page: SplashRoute.page,
              initial: true,
            ),
            AutoRoute(
              path: LoginView.routeName,
              page: LoginRoute.page,
            ),
            AutoRoute(
              path: RegisterView.routeName,
              page: RegisterRoute.page,
            ),
          ],
        ),
        AutoRoute(page: BottomNavWrapperRoute.page, children: [
          AutoRoute(
            path: BottomNavView.routeName,
            page: BottomNavRoute.page,
            initial: true,
            children: [
              AutoRoute(
                page: HomeWrapperRoute.page,
                children: [
                  AutoRoute(
                    path: HomeView.routeName,
                    page: HomeRoute.page,
                    initial: true,
                  ),
                ],
              ),
              AutoRoute(
                page: ProfileWrapperRoute.page,
                children: [
                  AutoRoute(
                    path: ProfileView.routeName,
                    page: ProfileRoute.page,
                    initial: true,
                  ),
                ],
              ),
            ],
          ),
        ]),
      ];
}
