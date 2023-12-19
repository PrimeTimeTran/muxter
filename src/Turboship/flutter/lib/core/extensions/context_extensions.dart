import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:turboship/all.dart';

extension ContextExtensions on BuildContext {
  double get bottomPadding => padding.bottom;
  double get bottomViewInsets => viewInsets.bottom;
  AppColors get colorTheme =>
      theme.extension<AppColors>() ?? SchemeConstants.lightColorsTheme;
  double get height => mediaQuery.size.height;
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
  AppLocalizations get l10n => AppLocalizations.of(this);
  double get leftPadding => padding.left;
  double get leftViewInsets => viewInsets.left;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  EdgeInsets get padding => mediaQuery.padding;
  double get pixelRatio => mediaQuery.devicePixelRatio;
  Color get primaryColor => colorTheme.bdDecorBrandBase;
  double get rightPadding => padding.right;
  double get rightViewInsets => viewInsets.right;
  AppTextTheme get textTheme =>
      theme.extension<AppTextTheme>() ?? SchemeConstants.textTheme;

  ThemeData get theme => Theme.of(this);
  double get topPadding => padding.top;
  double get topViewInsets => viewInsets.top;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  double get width => mediaQuery.size.width;

  // navigator
  void popUntil(String routeName) =>
      Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  void popUntilFirst() => Navigator.of(this).popUntil((route) => route.isFirst);
}
