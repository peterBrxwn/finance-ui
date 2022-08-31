// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;
  static const Color grey = Colors.grey;
  static const Color notBlack = Color.fromRGBO(27, 27, 27, 1);
  static const Color iconGrey = Color(0xFFC7C7CC);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color black = Colors.black;
  static const Color background = Color(0xFFf8f9fb);
  static const Color searchBar = Color(0xFFeff0f4);

  static const Color _themeBlue = Color(0xFF0057FF);
  static const Color _themeRed = Color(0xFFFF3636);
  static const Color _themeWarn = Color(0xFFF7C46C);

  static final FlexSchemeColor _schemeLight = FlexSchemeColor.from(
    primary: _themeBlue,
    secondary: _themeWarn,
    error: _themeRed,
  );
  static const double _appBarOpacity = 0.95;
  static const bool _swapColors = false;
  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(fontSize: 57, fontWeight: FontWeight.w900),
    headline2: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
    headline3: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
    headline4: TextStyle(fontWeight: FontWeight.w900),
    headline5: TextStyle(fontWeight: FontWeight.w900),
    headline6: TextStyle(fontWeight: FontWeight.w900),
    subtitle1: TextStyle(fontWeight: FontWeight.bold),
    subtitle2: TextStyle(fontWeight: FontWeight.bold),
    overline: TextStyle(fontSize: 11, letterSpacing: 0.5),
  );
  static const FlexSurfaceMode _surfaceMode =
      FlexSurfaceMode.highBackgroundLowScaffold;
  static const int _blendLevel = 15;
  static const FlexSubThemesData _subThemesData = FlexSubThemesData(
    interactionEffects: true,
    defaultRadius: 5,
    bottomSheetRadius: 24,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    inputDecoratorIsFilled: false,
    inputDecoratorUnfocusedHasBorder: true,
    elevatedButtonElevation: 1,
    thickBorderWidth: 2,
    thinBorderWidth: 1.5,
  );
  static const bool _transparentStatusBar = true;
  static const FlexTabBarStyle _tabBarForAppBar = FlexTabBarStyle.forAppBar;
  static const bool _tooltipsMatchBackground = true;
  static final VisualDensity _visualDensity =
      FlexColorScheme.comfortablePlatformDensity;
  static final TargetPlatform _platform = defaultTargetPlatform;

  static ThemeData themeDataLight = FlexThemeData.light(
    colors: _schemeLight,
    swapColors: _swapColors,
    lightIsWhite: true,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: _appBarOpacity,
    transparentStatusBar: _transparentStatusBar,
    tabBarStyle: _tabBarForAppBar,
    surfaceMode: _surfaceMode,
    blendLevel: _blendLevel,
    tooltipsMatchBackground: _tooltipsMatchBackground,
    onPrimary: white,
    onError: white,
    onSecondary: white,
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    subThemesData: _subThemesData,
    visualDensity: _visualDensity,
    platform: _platform,
  ).copyWith(brightness: Brightness.light, useMaterial3: true);
}
