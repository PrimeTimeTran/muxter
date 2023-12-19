import '_scheme_data.g.dart';
import 'app_colors_ext.dart';
import 'text_theme_ext.dart';

class SchemeConstants {
  static AppColors get darkColorsTheme =>
      _getThemeColors(const OneLongLEVEL2COLORS.dark());

  static AppColors get lightColorsTheme =>
      _getThemeColors(const OneLongLEVEL2COLORS.light());

  static AppColors _getThemeColors(OneLongLEVEL2COLORS schemeData) {
    return AppColors(
      txtNormalPrimary: schemeData.txtScheme.normalPrimary,
      txtNormalSecondary: schemeData.txtScheme.normalSecondary,
      txtNormalTertiary: schemeData.txtScheme.normalTertiary,
      txtNormalDisabled: schemeData.txtScheme.normalDisabled,
      txtNormalBrand: schemeData.txtScheme.normalBrand,
      txtInversePrimary: schemeData.txtScheme.inversePrimary,
      txtInverseSecondary: schemeData.txtScheme.inverseSecondary,
      txtInverseDisabled: schemeData.txtScheme.inverseDisabled,
      txtStatusSuccess: schemeData.txtScheme.statusSuccess,
      txtStatusDanger: schemeData.txtScheme.statusDanger,
      txtStatusWarning: schemeData.txtScheme.statusWarning,
      icNormalPrimary: schemeData.icScheme.normalPrimary,
      icNormalSecondary: schemeData.icScheme.normalSecondary,
      icNormalTertiary: schemeData.icScheme.normalTertiary,
      icNormalDisabled: schemeData.icScheme.normalDisabled,
      icNormalBrand: schemeData.icScheme.normalBrand,
      icInversePrimary: schemeData.icScheme.inversePrimary,
      icInverseSecondary: schemeData.icScheme.inverseSecondary,
      icInverseDisabled: schemeData.icScheme.inverseDisabled,
      icInverseTertiary: schemeData.icScheme.inverseTertiary,
      icStatusSuccess: schemeData.icScheme.statusSuccess,
      icStatusInfo: schemeData.icScheme.statusInfo,
      icStatusDanger: schemeData.icScheme.statusDanger,
      icStatusWarning: schemeData.icScheme.statusWarning,
      bgSurfaceMain: schemeData.bgScheme.surfaceMain,
      bgSurfaceSf1: schemeData.bgScheme.surfaceSf1,
      bgSurfaceSf2: schemeData.bgScheme.surfaceSf2,
      bgSurfaceSf3: schemeData.bgScheme.surfaceSf3,
      bgSurfaceDisabled: schemeData.bgScheme.surfaceDisabled,
      bgSurfaceInverseMain: schemeData.bgScheme.surfaceInverseMain,
      bgSurfaceInverseSf1: schemeData.bgScheme.surfaceInverseSf1,
      bgSurfaceInverseSf2: schemeData.bgScheme.surfaceInverseSf2,
      bgDecorBrandDarker: schemeData.bgScheme.decorBrandDarker,
      bgDecorBrandBase: schemeData.bgScheme.decorBrandBase,
      bgDecorBrandLighter: schemeData.bgScheme.decorBrandLighter,
      bgDecorBrandLightest: schemeData.bgScheme.decorBrandLightest,
      bgStatusSuccess: schemeData.bgScheme.statusSuccess,
      bgStatusInfo: schemeData.bgScheme.statusInfo,
      bgStatusWarning: schemeData.bgScheme.statusWarning,
      bgStatusDanger: schemeData.bgScheme.statusDanger,
      bgStatusDelete: schemeData.bgScheme.statusDelete,
      bdSurfaceMain: schemeData.bdScheme.surfaceMain,
      bdSurfaceSf2: schemeData.bdScheme.surfaceSf2,
      bdSurfaceSf3: schemeData.bdScheme.surfaceSf3,
      bdSurfaceInverseMain: schemeData.bdScheme.surfaceInverseMain,
      bdSurfaceInverseSf1: schemeData.bdScheme.surfaceInverseSf1,
      bdDecorBrandDarker: schemeData.bdScheme.decorBrandDarker,
      bdDecorBrandBase: schemeData.bdScheme.decorBrandBase,
      bdDecorBrandLighter: schemeData.bdScheme.decorBrandLighter,
      bdStatusSuccess: schemeData.bdScheme.statusSuccess,
      bdStatusInfo: schemeData.bdScheme.statusInfo,
      bdStatusDanger: schemeData.bdScheme.statusDanger,
      bdStatusWarning: schemeData.bdScheme.statusWarning,
    );
  }

  static AppTextTheme get textTheme {
    final textTheme = OneLongTextTheme();

    return AppTextTheme(
      headingDisplaySemibold: textTheme.heading.headingDisplaySemibold,
      headingH15xlSemibold: textTheme.heading.headingH15xlSemibold,
      headingH24xlSemibold: textTheme.heading.headingH24xlSemibold,
      headingH33xlSemibold: textTheme.heading.headingH33xlSemibold,
      headingH42xlSemibold: textTheme.heading.headingH42xlSemibold,
      b16LgSemiBold: textTheme.b16lg.b16LgSemiBold,
      b16LgMedium: textTheme.b16lg.b16LgMedium,
      b16LgRegular: textTheme.b16lg.b16LgRegular,
      b16LgItalic: textTheme.b16lg.b16LgItalic,
      b16LgCaps: textTheme.b16lg.b16LgCaps,
      b14BaseSemiBold: textTheme.b14base.b14BaseSemiBold,
      b14BaseMedium: textTheme.b14base.b14BaseMedium,
      b14BaseRegular: textTheme.b14base.b14BaseRegular,
      b14BaseItalic: textTheme.b14base.b14BaseItalic,
      b14BaseCaps: textTheme.b14base.b14BaseCaps,
      b12SmSemiBold: textTheme.b12sm.b12SmSemiBold,
      b12SmMedium: textTheme.b12sm.b12SmMedium,
      b12SmRegular: textTheme.b12sm.b12SmRegular,
      b12SmItalic: textTheme.b12sm.b12SmItalic,
      b12SmCaps: textTheme.b12sm.b12SmCaps,
      b10XsSemiBold: textTheme.b10xs.b10XsSemiBold,
      b10XsMedium: textTheme.b10xs.b10XsMedium,
      b10XsRegular: textTheme.b10xs.b10XsRegular,
    );
  }
}
