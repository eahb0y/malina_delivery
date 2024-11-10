import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_delivery/constants/constants.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/features/main/presentation/bloc/main_bloc.dart';
import 'package:malina_delivery/generated/l10n.dart';
import 'package:malina_delivery/route/app_routes.dart';
import 'package:malina_delivery/route/name_routes.dart';

class MainPage extends StatelessWidget {
  final String? initialRoute;

  const MainPage({
    super.key,
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => sl<MainBloc>()),
        // BlocProvider(create: (_) => sl<HomeBloc>()),
        // BlocProvider(create: (_) => sl<ClientListBloc>()),
        // BlocProvider(create: (_) => sl<ProfileBloc>()),
        // BlocProvider(create: (_) => sl<CalculatorBloc>()),
      ],
      child: const MainBody(),
    );
  }
}

class MainBody extends StatelessWidget {
  final String? initialRoute;

  const MainBody({
    super.key,
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.tab.index != 0 ? false : true,
          onPopInvokedWithResult: (_, __) {
            if (state.tab.index != 0) {
              Navigator.of(shellRootNavigatorKey.currentContext!)
                  .pushNamedAndRemoveUntil(
                Routes.home,
                (route) => false,
              );
              context
                  .read<MainBloc>()
                  .add(const ChangeTabCallEvent(tab: MainTab.home));
            }
          },
          child: Scaffold(
            body: Navigator(
              key: shellRootNavigatorKey,
              initialRoute: initialRoute,
              onGenerateRoute: AppRoutes.onShellGenerateRoute,
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: LightThemeColors.white,
                  ),
                ),
              ),
              height: 68,
              child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: LightThemeColors.white,
                  currentIndex: state.tab.index,
                  onTap: (index) => changeTap(context, index),
                  landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                  unselectedLabelStyle: AppTextStyles.unSelectedTab,
                  selectedLabelStyle: AppTextStyles.selectedTab,
                  items: [
                    _buildMenuItem(
                      icon: "ic_main",
                      text: AppLocalization.of(context).home,
                    ),
                    _buildMenuItem(
                      icon: "ic_get_limit",
                      text: AppLocalization.of(context).favourite,
                    ),
                    _buildMenuItem(
                      icon: "ic_calculator",
                      text: AppLocalization.of(context).profile,
                    ),
                    _buildMenuItem(
                      icon: "ic_clients",
                      text: AppLocalization.of(context).basket,
                    ),
                    _buildMenuItem(
                      icon: "ic_profile_tab",
                      text: AppLocalization.of(context).profile,
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildMenuItem({
    required String icon,
    required String text,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/svg/$icon.svg",
        colorFilter: const ColorFilter.mode(
          LightThemeColors.gray,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        "assets/svg/$icon.svg",
        colorFilter: const ColorFilter.mode(
          LightThemeColors.red,
          BlendMode.srcIn,
        ),
      ),
      label: text,
    );
  }

  void changeTap(BuildContext context, int index) {
    context
        .read<MainBloc>()
        .add(ChangeTabCallEvent(tab: MainTab.values[index]));
    switch (index) {
      case 0:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.home,
          (route) => false,
        );
        break;
      case 1:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.favourite,
          (route) => false,
        );
        break;
      case 2:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.profile,
          (route) => false,
        );
        break;
      case 3:
        Navigator.of(shellRootNavigatorKey.currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.basket,
          (route) => false,
        );
        break;
    }
  }
}
