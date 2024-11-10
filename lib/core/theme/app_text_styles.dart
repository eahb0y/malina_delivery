import 'package:flutter/material.dart';

import 'colors/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const flightPreferences = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.white,
  );
  static const unSelectedTab = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.gray,
  );
  static const selectedTab = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.red,
  );
}
