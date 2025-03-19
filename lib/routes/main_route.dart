import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/model/model_data_dummy.dart';
import '../modules/detail_data/detail_data_view.dart';
import '../modules/list_data/list_data_view.dart';
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
  List<CupertinoRoute> get routes => [
        CupertinoRoute(
          page: OnBoardWrapperRoute.page,
          initial: true,
          children: [
            CupertinoRoute(
              page: ListDataRoute.page,
              path: ListDataView.routeName,
              initial: true,
            ),
            CupertinoRoute(
              page: DetailDataRoute.page,
              path: DetailDataView.routeName,
            ),
          ],
        ),
      ];
}
