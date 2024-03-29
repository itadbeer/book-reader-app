import 'package:flutter/material.dart';

final onPrimaryHighEmphasis = Colors.white;
final onSurfaceHighEmphasis = Color.fromRGBO(0, 0, 0, 0.88);
final onSurface = Color.fromRGBO(0, 0, 0, 0.64);
final onSurfaceBorder = Color.fromRGBO(0, 0, 0, 0.12);
final onSurfaceMediumEmphasis = Color.fromRGBO(0, 0, 0, 0.64);
final onSurfaceDisabled = Color.fromRGBO(0, 0, 0, 0.4);
final surface = Color.fromRGBO(255, 255, 255, 1);
final primaryLightVariant = Color.fromRGBO(79, 179, 191, 1);
final error = Color.fromRGBO(243, 26, 63, 1);
final ThemeData myTheme = ThemeData(
  appBarTheme: AppBarTheme(
    titleSpacing: 0,
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: onPrimaryHighEmphasis,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
  ),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  brightness: Brightness.light,
  primaryColor: Color(0xFF00838F),
  primaryColorBrightness: Brightness.light,
  primaryColorLight: Color(0xFF4FB3BF),
  primaryColorDark: Color(0xff005662),
  accentColor: Color(0xFF00838F),
  accentColorBrightness: Brightness.light,
  canvasColor: Color(0XFFFFFFFF),
  scaffoldBackgroundColor: Color(0XFFFFFFFF),
  bottomAppBarColor: Color(0XFFFFFFFF),
  cardColor: Color(0XFFFFFFFF),
  fontFamily: 'Vazir',
);
