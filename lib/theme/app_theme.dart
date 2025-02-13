import 'package:flutter/material.dart';
import 'package:hcp_test/theme/text_theme.dart';

import 'color_theme.dart';

class AppTheme with HCTextTheme {
  ThemeData makeAppLightTheme() {
    return ThemeData(
      textTheme: makeInputTextTheme(HCColors.textColorDefault),
      colorScheme: ColorScheme(
        onPrimary: HCColors.primaryColorLighter,
        primary: HCColors.primaryColorDefault,
        secondary: HCColors.secondaryColorDefault,
        onSurface: HCColors.textColorDefault,
        surface: HCColors.textColorLight,
        onSecondary: HCColors.textColorDefault,
        error: HCColors.colorError,
        shadow: HCColors.shadowColor,
        tertiary: HCColors.blackColor,
        onTertiary: HCColors.textColorLighter,
        background: HCColors.bgColorDefault,
        onError: HCColors.blackColor,
        onBackground: HCColors.bgColorLighter,
        brightness: Brightness.light,
        outline: HCColors.greyLight,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: HCColors.primaryColorDefault,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  ThemeData makeAppDarkTheme() {
    return ThemeData(
      textTheme: makeInputTextTheme(HCColors.bgColorDefault),
      colorScheme: ColorScheme(
        onPrimary: HCColors.bgColorDefault,
        primary: HCColors.primaryColorDefault,
        secondary: HCColors.blackColor,
        onSurface: HCColors.onSecondaryColorDefault,
        surface: HCColors.onSecondaryColorDefault,
        onSecondary: HCColors.bgColorDefault,
        error: HCColors.colorError,
        shadow: HCColors.greyDark,
        tertiary: HCColors.blackColor,
        onTertiary: HCColors.textColorLighter,
        background: HCColors.textColorLight,
        onError: HCColors.colorError,
        onBackground: HCColors.bgColorLighter,
        brightness: Brightness.dark,
        outline: HCColors.greyLight,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: HCColors.primaryColorDefault,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}
