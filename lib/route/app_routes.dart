import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:malina_delivery/features/basket/presentation/page/basket_page.dart';
import 'package:malina_delivery/features/favourite/presentation/page/favourite_page.dart';
import 'package:malina_delivery/features/home/presentation/page/home_page.dart';
import 'package:malina_delivery/features/profile/presentation/page/profile_page.dart';
import 'package:malina_delivery/features/splash/presentation/page/splash_page.dart';
import 'package:malina_delivery/route/name_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return buildPageWithDefaultTransition(child: const SplashPage());
      case Routes.home:
      default:
        return buildPageWithDefaultTransition(child: const HomePage());
    }
  }

  static Route<dynamic> onShellGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("route shell :  ${settings.name}");
    }
    switch (settings.name) {
      case Routes.initial:
        return buildPageWithDefaultTransition(child: const HomePage());
      case Routes.favourite:
        return buildPageWithDefaultTransition(child: const FavouritePage());
      case Routes.profile:
        return buildPageWithDefaultTransition(child: const ProfilePage());
      case Routes.basket:
        return buildPageWithDefaultTransition(child: const BasketPage());
      default:
        return buildPageWithDefaultTransition(child: const HomePage());
    }
  }
}

PageRouteBuilder buildPageWithDefaultTransition<T>({required Widget child}) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

PageRouteBuilder buildPageWithNoTransition<T>({required Widget child}) {
  return PageRouteBuilder<T>(
    reverseTransitionDuration: Duration.zero,
    transitionDuration: Duration.zero,
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
