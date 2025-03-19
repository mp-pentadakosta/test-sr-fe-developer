import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme_data.dart';
import 'core/env/flavors.dart';
import 'provider/multi_bloc_data.dart';
import 'routes/main_route.dart';
import 'routes/route_logger.dart';

final appRouter = AppRouter();

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: _flavorBanner(
        show: kDebugMode,
        child: MaterialApp.router(
          scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: F.banner(),
          title: F.title,
          theme: themeData,
          routerConfig: appRouter.config(
            navigatorObservers: () => [RouteLogger()],
          ),
        ),
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.env,
              color: Colors.green,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
