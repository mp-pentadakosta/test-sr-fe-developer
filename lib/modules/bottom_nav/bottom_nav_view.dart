import 'package:auto_route/auto_route.dart';
import '../../core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

@RoutePage()
class BottomNavView extends StatefulWidget {
  static const routeName = 'bottom-sheet';

  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        // HomeWrapperRoute(),
        // ProfileWrapperRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      floatingActionButtonBuilder: (context, tabsRouter) => Container(
        height: 65,
        width: context.mQWidth(1) - context.padding4,
        decoration: BoxDecoration(
          color: AppColors.elevationLevel(ElevationType.level1),
          borderRadius: BorderRadius.circular(context.padding2),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: context.padding2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _styleBottomNavBar(
              context,
              icons: Icons.home_filled,
              text: 'Home',
              isSelected: tabsRouter.activeIndex == 0,
              index: 0,
              tabsRouter: tabsRouter,
            ),
            _styleBottomNavBar(
              context,
              icons: Icons.calendar_today_rounded,
              text: 'Appointment',
              isSelected: tabsRouter.activeIndex == 1,
              index: 1,
              tabsRouter: tabsRouter,
            ),
            _styleBottomNavBar(
              context,
              icons: Icons.person,
              text: 'Profile',
              isSelected: tabsRouter.activeIndex == 2,
              index: 2,
              tabsRouter: tabsRouter,
            ),
          ],
        ),
      ),
    );
  }

  Widget _styleBottomNavBar(
    BuildContext context, {
    required TabsRouter tabsRouter,
    required int index,
    required IconData icons,
    required String text,
    required bool isSelected,
  }) {
    return InkWell(
      enableFeedback: true,
      splashColor: AppColors.primary.withAlpha(30),
      onTap: () {
        _customNavigation(context, index, tabsRouter);
      },
      onDoubleTap: () {
        _customNavigationDoubleTab(context, index, tabsRouter);
      },
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons,
                  color: isSelected ? AppColors.primary : AppColors.backdrop,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : AppColors.backdrop,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: context.padding0,
            width: context.padding5,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.padding1),
                topRight: Radius.circular(context.padding1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _customNavigation(
      BuildContext context, int index, TabsRouter tabsRouter) {
    switch (index) {
      case 0:
        tabsRouter.setActiveIndex(0);
        break;
      case 1:
        tabsRouter.setActiveIndex(1);
        break;
      case 2:
        tabsRouter.setActiveIndex(2);
        break;
      default:
    }
  }

  void _customNavigationDoubleTab(
      BuildContext context, int index, TabsRouter tabsRouter) {
    switch (index) {
      case 0:
        // context.router.navigate(const HomeWrapperRoute());
        break;
      case 1:
        // context.router.navigate(const AppointmentWrapperRoute());
        break;
      case 2:
        // context.router.navigate(const ProfileWrapperRoute());
        break;
      default:
    }
  }
}
