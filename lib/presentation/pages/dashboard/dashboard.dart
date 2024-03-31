import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/assets.gen.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/core/languages/translation_keys.g.dart';
import 'package:movies_app/presentation/navigation/navigation.dart';
import 'package:movies_app/presentation/widgets/custom_icon_svg.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DashboardHomeRoute(),
        DashboardAccountRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        backgroundColor: Colors.black,
        selectedLabelStyle:
            context.typographies.caption2Bold.copyWith(color: Colors.amber),
        unselectedLabelStyle:
            context.typographies.caption2Bold.copyWith(color: Colors.white),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            activeIcon: CustomIconSvg(
                path: Assets.icons.svg.icDashboardHome.path, isSelected: true),
            icon: CustomIconSvg(path: Assets.icons.svg.icDashboardHome.path),
            label: context.tr(LocaleKeys.Dashboard_Home),
          ),
          BottomNavigationBarItem(
            activeIcon: CustomIconSvg(
                path: Assets.icons.svg.icDashboardAccount.path,
                isSelected: true),
            icon: CustomIconSvg(path: Assets.icons.svg.icDashboardAccount.path),
            label: context.tr(LocaleKeys.Dashboard_Account),
          ),
        ],
      ),
    );
  }
}
