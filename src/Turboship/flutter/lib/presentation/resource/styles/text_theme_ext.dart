import 'package:flutter/material.dart';

import 'app_colors_ext.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle headingDisplaySemibold;
  final TextStyle headingH15xlSemibold;
  final TextStyle headingH24xlSemibold;
  final TextStyle headingH33xlSemibold;
  final TextStyle headingH42xlSemibold;

  final TextStyle b16LgSemiBold;
  final TextStyle b16LgMedium;
  final TextStyle b16LgRegular;
  final TextStyle b16LgItalic;
  final TextStyle b16LgCaps;

  final TextStyle b14BaseSemiBold;
  final TextStyle b14BaseMedium;
  final TextStyle b14BaseRegular;
  final TextStyle b14BaseItalic;
  final TextStyle b14BaseCaps;

  final TextStyle b12SmSemiBold;
  final TextStyle b12SmMedium;
  final TextStyle b12SmRegular;
  final TextStyle b12SmItalic;
  final TextStyle b12SmCaps;

  final TextStyle b10XsSemiBold;
  final TextStyle b10XsMedium;
  final TextStyle b10XsRegular;

  AppTextTheme({
    required this.headingDisplaySemibold,
    required this.headingH15xlSemibold,
    required this.headingH24xlSemibold,
    required this.headingH33xlSemibold,
    required this.headingH42xlSemibold,
    required this.b16LgSemiBold,
    required this.b16LgMedium,
    required this.b16LgRegular,
    required this.b16LgItalic,
    required this.b16LgCaps,
    required this.b14BaseSemiBold,
    required this.b14BaseMedium,
    required this.b14BaseRegular,
    required this.b14BaseItalic,
    required this.b14BaseCaps,
    required this.b12SmSemiBold,
    required this.b12SmMedium,
    required this.b12SmRegular,
    required this.b12SmItalic,
    required this.b12SmCaps,
    required this.b10XsSemiBold,
    required this.b10XsMedium,
    required this.b10XsRegular,
  });

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? headingDisplaySemibold,
    TextStyle? headingH15xlSemibold,
    TextStyle? headingH24xlSemibold,
    TextStyle? headingH33xlSemibold,
    TextStyle? headingH42xlSemibold,
    TextStyle? b16LgSemiBold,
    TextStyle? b16LgMedium,
    TextStyle? b16LgRegular,
    TextStyle? b16LgItalic,
    TextStyle? b16LgCaps,
    TextStyle? b14BaseSemiBold,
    TextStyle? b14BaseMedium,
    TextStyle? b14BaseRegular,
    TextStyle? b14BaseItalic,
    TextStyle? b14BaseCaps,
    TextStyle? b12SmSemiBold,
    TextStyle? b12SmMedium,
    TextStyle? b12SmRegular,
    TextStyle? b12SmItalic,
    TextStyle? b12SmCaps,
    TextStyle? b10XsSemiBold,
    TextStyle? b10XsMedium,
    TextStyle? b10XsRegular,
  }) {
    return AppTextTheme(
      headingDisplaySemibold: headingDisplaySemibold ?? this.headingDisplaySemibold,
      headingH15xlSemibold: headingH15xlSemibold ?? this.headingH15xlSemibold,
      headingH24xlSemibold: headingH24xlSemibold ?? this.headingH24xlSemibold,
      headingH33xlSemibold: headingH33xlSemibold ?? this.headingH33xlSemibold,
      headingH42xlSemibold: headingH42xlSemibold ?? this.headingH42xlSemibold,
      b16LgSemiBold: b16LgSemiBold ?? this.b16LgSemiBold,
      b16LgMedium: b16LgMedium ?? this.b16LgMedium,
      b16LgRegular: b16LgRegular ?? this.b16LgRegular,
      b16LgItalic: b16LgItalic ?? this.b16LgItalic,
      b16LgCaps: b16LgCaps ?? this.b16LgCaps,
      b14BaseSemiBold: b14BaseSemiBold ?? this.b14BaseSemiBold,
      b14BaseMedium: b14BaseMedium ?? this.b14BaseMedium,
      b14BaseRegular: b14BaseRegular ?? this.b14BaseRegular,
      b14BaseItalic: b14BaseItalic ?? this.b14BaseItalic,
      b14BaseCaps: b14BaseCaps ?? this.b14BaseCaps,
      b12SmSemiBold: b12SmSemiBold ?? this.b12SmSemiBold,
      b12SmMedium: b12SmMedium ?? this.b12SmMedium,
      b12SmRegular: b12SmRegular ?? this.b12SmRegular,
      b12SmItalic: b12SmItalic ?? this.b12SmItalic,
      b12SmCaps: b12SmCaps ?? this.b12SmCaps,
      b10XsSemiBold: b10XsSemiBold ?? this.b10XsSemiBold,
      b10XsMedium: b10XsMedium ?? this.b10XsMedium,
      b10XsRegular: b10XsRegular ?? this.b10XsRegular,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme(
      headingDisplaySemibold: TextStyle.lerp(
        headingDisplaySemibold,
        other.headingDisplaySemibold,
        t,
      )!,
      headingH15xlSemibold: TextStyle.lerp(
        headingH15xlSemibold,
        other.headingH15xlSemibold,
        t,
      )!,
      headingH24xlSemibold: TextStyle.lerp(
        headingH24xlSemibold,
        other.headingH24xlSemibold,
        t,
      )!,
      headingH33xlSemibold: TextStyle.lerp(
        headingH33xlSemibold,
        other.headingH33xlSemibold,
        t,
      )!,
      headingH42xlSemibold: TextStyle.lerp(
        headingH42xlSemibold,
        other.headingH42xlSemibold,
        t,
      )!,
      b16LgSemiBold: TextStyle.lerp(
        b16LgSemiBold,
        other.b16LgSemiBold,
        t,
      )!,
      b16LgMedium: TextStyle.lerp(
        b16LgMedium,
        other.b16LgMedium,
        t,
      )!,
      b16LgRegular: TextStyle.lerp(
        b16LgRegular,
        other.b16LgRegular,
        t,
      )!,
      b16LgItalic: TextStyle.lerp(
        b16LgItalic,
        other.b16LgItalic,
        t,
      )!,
      b16LgCaps: TextStyle.lerp(
        b16LgCaps,
        other.b16LgCaps,
        t,
      )!,
      b14BaseSemiBold: TextStyle.lerp(
        b14BaseSemiBold,
        other.b14BaseSemiBold,
        t,
      )!,
      b14BaseMedium: TextStyle.lerp(
        b14BaseMedium,
        other.b14BaseMedium,
        t,
      )!,
      b14BaseRegular: TextStyle.lerp(
        b14BaseRegular,
        other.b14BaseRegular,
        t,
      )!,
      b14BaseItalic: TextStyle.lerp(
        b14BaseItalic,
        other.b14BaseItalic,
        t,
      )!,
      b14BaseCaps: TextStyle.lerp(
        b14BaseCaps,
        other.b14BaseCaps,
        t,
      )!,
      b12SmSemiBold: TextStyle.lerp(
        b12SmSemiBold,
        other.b12SmSemiBold,
        t,
      )!,
      b12SmMedium: TextStyle.lerp(
        b12SmMedium,
        other.b12SmMedium,
        t,
      )!,
      b12SmRegular: TextStyle.lerp(
        b12SmRegular,
        other.b12SmRegular,
        t,
      )!,
      b12SmItalic: TextStyle.lerp(
        b12SmItalic,
        other.b12SmItalic,
        t,
      )!,
      b12SmCaps: TextStyle.lerp(
        b12SmCaps,
        other.b12SmCaps,
        t,
      )!,
      b10XsSemiBold: TextStyle.lerp(
        b10XsSemiBold,
        other.b10XsSemiBold,
        t,
      )!,
      b10XsMedium: TextStyle.lerp(
        b10XsMedium,
        other.b10XsMedium,
        t,
      )!,
      b10XsRegular: TextStyle.lerp(
        b10XsRegular,
        other.b10XsRegular,
        t,
      )!,
    );
  }
}

extension AppTextThemeExtensionX on AppTextTheme {
  TextTheme toTextTheme(TextTheme textTheme, AppColors colors) {
    return textTheme
        .apply(
          displayColor: colors.txtNormalPrimary,
          bodyColor: colors.txtNormalSecondary,
        )
        .copyWith(
          displayLarge: headingDisplaySemibold,
          displayMedium: headingH15xlSemibold,
          displaySmall: headingH24xlSemibold,
          headlineMedium: headingH33xlSemibold,
          headlineSmall: headingH42xlSemibold,
          bodyLarge: b16LgSemiBold,
          bodyMedium: b16LgMedium,
          titleMedium: b14BaseSemiBold,
          titleSmall: b14BaseMedium,
          labelLarge: b14BaseMedium,
          bodySmall: b12SmMedium,
          labelSmall: b10XsMedium,
        );
  }

  ThemeExtension<AppTextTheme> applyColor(AppColors colors) {
    return copyWith(
      headingDisplaySemibold: headingDisplaySemibold.copyWith(
        color: colors.txtNormalPrimary,
      ),
      headingH15xlSemibold: headingH15xlSemibold.copyWith(
        color: colors.txtNormalPrimary,
      ),
      headingH24xlSemibold: headingH24xlSemibold.copyWith(
        color: colors.txtNormalPrimary,
      ),
      headingH33xlSemibold: headingH33xlSemibold.copyWith(
        color: colors.txtNormalPrimary,
      ),
      headingH42xlSemibold: headingH42xlSemibold.copyWith(
        color: colors.txtNormalPrimary,
      ),
      b16LgSemiBold: b16LgSemiBold.copyWith(
        color: colors.txtNormalPrimary,
      ),
      b16LgMedium: b16LgMedium.copyWith(
        color: colors.txtNormalPrimary,
      ),
      b16LgRegular: b16LgRegular.copyWith(
        color: colors.txtNormalPrimary,
      ),
      b16LgItalic: b16LgItalic.copyWith(
        color: colors.txtNormalPrimary,
      ),
      b16LgCaps: b16LgCaps.copyWith(
        color: colors.txtNormalPrimary,
      ),
      b14BaseSemiBold: b14BaseSemiBold.copyWith(
        color: colors.txtNormalSecondary,
      ),
      b14BaseMedium: b14BaseMedium.copyWith(
        color: colors.txtNormalSecondary,
      ),
      b14BaseRegular: b14BaseRegular.copyWith(
        color: colors.txtNormalSecondary,
      ),
      b14BaseItalic: b14BaseItalic.copyWith(
        color: colors.txtNormalSecondary,
      ),
      b14BaseCaps: b14BaseCaps.copyWith(
        color: colors.txtNormalSecondary,
      ),
      b12SmSemiBold: b12SmSemiBold.copyWith(
        color: colors.txtNormalTertiary,
      ),
      b12SmMedium: b12SmMedium.copyWith(
        color: colors.txtNormalTertiary,
      ),
      b12SmRegular: b12SmRegular.copyWith(
        color: colors.txtNormalTertiary,
      ),
      b12SmItalic: b12SmItalic.copyWith(
        color: colors.txtNormalTertiary,
      ),
      b12SmCaps: b12SmCaps.copyWith(
        color: colors.txtNormalTertiary,
      ),
      b10XsSemiBold: b10XsSemiBold.copyWith(
        color: colors.txtNormalTertiary,
      ),
      b10XsMedium: b10XsMedium.copyWith(
        color: colors.txtNormalTertiary,
      ),
      b10XsRegular: b10XsRegular.copyWith(
        color: colors.txtNormalTertiary,
      ),
    );
  }
}
