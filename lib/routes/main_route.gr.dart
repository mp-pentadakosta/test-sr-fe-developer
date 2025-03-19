// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'main_route.dart';

/// generated route for
/// [BottomNavWrapperPage]
class BottomNavWrapperRoute extends PageRouteInfo<void> {
  const BottomNavWrapperRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BottomNavWrapperPage();
    },
  );
}

/// generated route for
/// [DetailDataView]
class DetailDataRoute extends PageRouteInfo<DetailDataRouteArgs> {
  DetailDataRoute({
    Key? key,
    required ModelDataDummy detailData,
    List<PageRouteInfo>? children,
  }) : super(
          DetailDataRoute.name,
          args: DetailDataRouteArgs(
            key: key,
            detailData: detailData,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailDataRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailDataRouteArgs>();
      return DetailDataView(
        key: args.key,
        detailData: args.detailData,
      );
    },
  );
}

class DetailDataRouteArgs {
  const DetailDataRouteArgs({
    this.key,
    required this.detailData,
  });

  final Key? key;

  final ModelDataDummy detailData;

  @override
  String toString() {
    return 'DetailDataRouteArgs{key: $key, detailData: $detailData}';
  }
}

/// generated route for
/// [HomeWrapperPage]
class HomeWrapperRoute extends PageRouteInfo<void> {
  const HomeWrapperRoute({List<PageRouteInfo>? children})
      : super(
          HomeWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeWrapperPage();
    },
  );
}

/// generated route for
/// [ListDataView]
class ListDataRoute extends PageRouteInfo<void> {
  const ListDataRoute({List<PageRouteInfo>? children})
      : super(
          ListDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListDataRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListDataView();
    },
  );
}

/// generated route for
/// [OnBoardWrapperPage]
class OnBoardWrapperRoute extends PageRouteInfo<void> {
  const OnBoardWrapperRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnBoardWrapperPage();
    },
  );
}

/// generated route for
/// [ProfileWrapperPage]
class ProfileWrapperRoute extends PageRouteInfo<void> {
  const ProfileWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ProfileWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileWrapperPage();
    },
  );
}
