import 'dart:math';

import 'package:flutter/material.dart';
import 'package:turboship/all.dart';

class AppThemeConstants {
  static ThemeData get dark {
    var random = Random();
    int randomIndex = random.nextInt(darks.length);
    final defaultTheme = darks[randomIndex];

    final appColors = SchemeConstants.darkColorsTheme;
    final textThemeExt = SchemeConstants.textTheme.applyColor(
      appColors,
    );

    final textTheme = (textThemeExt as AppTextTheme).toTextTheme(
      defaultTheme.textTheme,
      appColors,
    );

    return _setupDefaultTheme(
      theme: defaultTheme,
      appColors: appColors,
      textTheme: textTheme,
      textThemeExt: textThemeExt,
      brightness: Brightness.dark,
    );
  }

  static ThemeData get light {
    var random = Random();
    int randomIndex = random.nextInt(lights.length);
    final defaultTheme = lights[randomIndex];

    final appColors = SchemeConstants.lightColorsTheme;
    final textThemeExt = SchemeConstants.textTheme.applyColor(
      appColors,
    );

    final textTheme = (textThemeExt as AppTextTheme).toTextTheme(
      defaultTheme.textTheme,
      appColors,
    );

    return _setupDefaultTheme(
      theme: defaultTheme,
      appColors: appColors,
      textTheme: textTheme,
      textThemeExt: textThemeExt,
      brightness: Brightness.light,
    );
  }

  const AppThemeConstants._();
  static ThemeData _setupDefaultTheme({
    required ThemeData theme,
    required AppColors appColors,
    required TextTheme textTheme,
    required ThemeExtension textThemeExt,
    required Brightness brightness,
  }) {
    return theme.copyWith(
      primaryColor: appColors.bgDecorBrandBase,
      textTheme: textTheme,
      colorScheme: appColors.toColorScheme(brightness),
      dividerTheme: DividerThemeData(
          color: appColors.bdSurfaceMain, thickness: 1.0, space: 5.0),
      iconTheme: IconThemeData(color: appColors.icNormalPrimary),
      extensions: [appColors, textThemeExt],
    );
  }
}
