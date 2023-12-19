import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color txtNormalPrimary;
  final Color txtNormalSecondary;
  final Color txtNormalTertiary;
  final Color txtNormalDisabled;
  final Color txtNormalBrand;
  final Color txtInversePrimary;
  final Color txtInverseSecondary;
  final Color txtInverseDisabled;
  final Color txtStatusSuccess;
  final Color txtStatusDanger;
  final Color txtStatusWarning;

  final Color icNormalPrimary;
  final Color icNormalSecondary;
  final Color icNormalTertiary;
  final Color icNormalDisabled;
  final Color icNormalBrand;
  final Color icInversePrimary;
  final Color icInverseSecondary;
  final Color icInverseDisabled;
  final Color icInverseTertiary;
  final Color icStatusSuccess;
  final Color icStatusInfo;
  final Color icStatusDanger;
  final Color icStatusWarning;

  final Color bgSurfaceMain;
  final Color bgSurfaceSf1;
  final Color bgSurfaceSf2;
  final Color bgSurfaceSf3;
  final Color bgSurfaceDisabled;
  final Color bgSurfaceInverseMain;
  final Color bgSurfaceInverseSf1;
  final Color bgSurfaceInverseSf2;
  final Color bgDecorBrandDarker;
  final Color bgDecorBrandBase;
  final Color bgDecorBrandLighter;
  final Color bgDecorBrandLightest;
  final Color bgStatusSuccess;
  final Color bgStatusInfo;
  final Color bgStatusWarning;
  final Color bgStatusDanger;
  final Color bgStatusDelete;

  final Color bdSurfaceMain;
  final Color bdSurfaceSf2;
  final Color bdSurfaceSf3;
  final Color bdSurfaceInverseMain;
  final Color bdSurfaceInverseSf1;
  final Color bdDecorBrandDarker;
  final Color bdDecorBrandBase;
  final Color bdDecorBrandLighter;
  final Color bdStatusSuccess;
  final Color bdStatusInfo;
  final Color bdStatusWarning;
  final Color bdStatusDanger;

  const AppColors({
    // txt
    required this.txtNormalPrimary,
    required this.txtNormalSecondary,
    required this.txtNormalTertiary,
    required this.txtNormalDisabled,
    required this.txtNormalBrand,
    required this.txtInversePrimary,
    required this.txtInverseSecondary,
    required this.txtInverseDisabled,
    required this.txtStatusSuccess,
    required this.txtStatusDanger,
    required this.txtStatusWarning,
    // ic
    required this.icNormalPrimary,
    required this.icNormalSecondary,
    required this.icNormalTertiary,
    required this.icNormalDisabled,
    required this.icNormalBrand,
    required this.icInversePrimary,
    required this.icInverseSecondary,
    required this.icInverseDisabled,
    required this.icInverseTertiary,
    required this.icStatusSuccess,
    required this.icStatusInfo,
    required this.icStatusWarning,
    required this.icStatusDanger,
    // bg
    required this.bgSurfaceMain,
    required this.bgSurfaceSf1,
    required this.bgSurfaceSf2,
    required this.bgSurfaceSf3,
    required this.bgSurfaceDisabled,
    required this.bgSurfaceInverseMain,
    required this.bgSurfaceInverseSf1,
    required this.bgSurfaceInverseSf2,
    required this.bgDecorBrandDarker,
    required this.bgDecorBrandBase,
    required this.bgDecorBrandLighter,
    required this.bgDecorBrandLightest,
    required this.bgStatusSuccess,
    required this.bgStatusInfo,
    required this.bgStatusWarning,
    required this.bgStatusDanger,
    required this.bgStatusDelete,
    // bd
    required this.bdSurfaceMain,
    required this.bdSurfaceSf2,
    required this.bdSurfaceSf3,
    required this.bdSurfaceInverseMain,
    required this.bdSurfaceInverseSf1,
    required this.bdDecorBrandDarker,
    required this.bdDecorBrandBase,
    required this.bdDecorBrandLighter,
    required this.bdStatusSuccess,
    required this.bdStatusInfo,
    required this.bdStatusWarning,
    required this.bdStatusDanger,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? txtNormalPrimary,
    Color? txtNormalSecondary,
    Color? txtNormalTertiary,
    Color? txtNormalDisabled,
    Color? txtNormalBrand,
    Color? txtInversePrimary,
    Color? txtInverseSecondary,
    Color? txtInverseTertiary,
    Color? txtStatusSuccess,
    Color? txtStatusDanger,
    Color? txtStatusWarning,
    Color? icNormalPrimary,
    Color? icNormalSecondary,
    Color? icNormalTertiary,
    Color? icNormalDisabled,
    Color? icInversePrimary,
    Color? icInverseSecondary,
    Color? icInverseTertiary,
    Color? icNormalBrand,
    Color? icStatusSuccess,
    Color? icStatusInfo,
    Color? icStatusDanger,
    Color? icStatusWarning,
    Color? bgSurfaceMain,
    Color? bgSurfaceSf1,
    Color? bgSurfaceSf2,
    Color? bgSurfaceSf3,
    Color? bgSurfaceDisabled,
    Color? bgSurfaceInverseMain,
    Color? bgSurfaceInverseSf1,
    Color? bgSurfaceInverseSf2,
    Color? bgDecorBrandDarker,
    Color? bgDecorBrandBase,
    Color? bgDecorBrandLighter,
    Color? bgDecorBrandLightest,
    Color? bgStatusSuccess,
    Color? bgStatusInfo,
    Color? bgStatusWarning,
    Color? bgStatusDanger,
    Color? bgStatusDelete,
    Color? bdSurfaceMain,
    Color? bdSurfaceSf2,
    Color? bdSurfaceSf3,
    Color? bdSurfaceInverseMain,
    Color? bdSurfaceInverseSf1,
    Color? bdDecorBrandDarker,
    Color? bdDecorBrandBase,
    Color? bdDecorBrandLighter,
    Color? bdStatusSuccess,
    Color? bdStatusInfo,
    Color? bdStatusWarning,
    Color? bdStatusDanger,
  }) {
    return AppColors(
      txtNormalPrimary: txtNormalPrimary ?? this.txtNormalPrimary,
      txtNormalSecondary: txtNormalSecondary ?? this.txtNormalSecondary,
      txtNormalTertiary: txtNormalTertiary ?? this.txtNormalTertiary,
      txtNormalDisabled: txtNormalDisabled ?? this.txtNormalDisabled,
      txtNormalBrand: txtNormalBrand ?? this.txtNormalBrand,
      txtInversePrimary: txtInversePrimary ?? this.txtInversePrimary,
      txtInverseSecondary: txtInverseSecondary ?? this.txtInverseSecondary,
      txtInverseDisabled: txtInverseTertiary ?? txtInverseDisabled,
      txtStatusSuccess: txtStatusSuccess ?? this.txtStatusSuccess,
      txtStatusDanger: txtStatusDanger ?? this.txtStatusDanger,
      txtStatusWarning: txtStatusWarning ?? this.txtStatusWarning,
      icNormalPrimary: icNormalPrimary ?? this.icNormalPrimary,
      icNormalSecondary: icNormalSecondary ?? this.icNormalSecondary,
      icNormalTertiary: icNormalTertiary ?? this.icNormalTertiary,
      icNormalDisabled: icNormalDisabled ?? this.icNormalDisabled,
      icNormalBrand: icNormalBrand ?? this.icNormalBrand,
      icInversePrimary: icInversePrimary ?? this.icInversePrimary,
      icInverseSecondary: icInverseSecondary ?? this.icInverseSecondary,
      icInverseDisabled: icInverseTertiary ?? icInverseDisabled,
      icInverseTertiary: icInverseTertiary ?? this.icInverseTertiary,
      icStatusSuccess: icStatusSuccess ?? this.icStatusSuccess,
      icStatusInfo: icStatusInfo ?? this.icStatusInfo,
      icStatusDanger: icStatusDanger ?? this.icStatusDanger,
      icStatusWarning: icStatusWarning ?? this.icStatusWarning,
      bgSurfaceMain: bgSurfaceMain ?? this.bgSurfaceMain,
      bgSurfaceSf1: bgSurfaceSf1 ?? this.bgSurfaceSf1,
      bgSurfaceSf2: bgSurfaceSf2 ?? this.bgSurfaceSf2,
      bgSurfaceSf3: bgSurfaceSf3 ?? this.bgSurfaceSf3,
      bgSurfaceDisabled: bgSurfaceDisabled ?? this.bgSurfaceDisabled,
      bgSurfaceInverseMain: bgSurfaceInverseMain ?? this.bgSurfaceInverseMain,
      bgSurfaceInverseSf1: bgSurfaceInverseSf1 ?? this.bgSurfaceInverseSf1,
      bgSurfaceInverseSf2: bgSurfaceInverseSf2 ?? this.bgSurfaceInverseSf2,
      bgDecorBrandDarker: bgDecorBrandDarker ?? this.bgDecorBrandDarker,
      bgDecorBrandBase: bgDecorBrandBase ?? this.bgDecorBrandBase,
      bgDecorBrandLighter: bgDecorBrandLighter ?? this.bgDecorBrandLighter,
      bgDecorBrandLightest: bgDecorBrandLightest ?? this.bgDecorBrandLightest,
      bgStatusSuccess: bgStatusSuccess ?? this.bgStatusSuccess,
      bgStatusInfo: bgStatusInfo ?? this.bgStatusInfo,
      bgStatusWarning: bgStatusWarning ?? this.bgStatusWarning,
      bgStatusDanger: bgStatusDanger ?? this.bgStatusDanger,
      bgStatusDelete: bgStatusDelete ?? this.bgStatusDelete,
      bdSurfaceMain: bdSurfaceMain ?? this.bdSurfaceMain,
      bdSurfaceSf2: bdSurfaceSf2 ?? this.bdSurfaceSf2,
      bdSurfaceSf3: bdSurfaceSf3 ?? this.bdSurfaceSf3,
      bdSurfaceInverseMain: bdSurfaceInverseMain ?? this.bdSurfaceInverseMain,
      bdSurfaceInverseSf1: bdSurfaceInverseSf1 ?? this.bdSurfaceInverseSf1,
      bdDecorBrandDarker: bdDecorBrandDarker ?? this.bdDecorBrandDarker,
      bdDecorBrandBase: bdDecorBrandBase ?? this.bdDecorBrandBase,
      bdDecorBrandLighter: bdDecorBrandLighter ?? this.bdDecorBrandLighter,
      bdStatusSuccess: bdStatusSuccess ?? this.bdStatusSuccess,
      bdStatusInfo: bdStatusInfo ?? this.bdStatusInfo,
      bdStatusDanger: bdStatusDanger ?? this.bdStatusDanger,
      bdStatusWarning: bdStatusWarning ?? this.bdStatusWarning,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other == null || other is! AppColors) {
      return this;
    }

    return AppColors(
      txtNormalPrimary: Color.lerp(txtNormalPrimary, other.txtNormalPrimary, t)!,
      txtNormalSecondary: Color.lerp(txtNormalSecondary, other.txtNormalSecondary, t)!,
      txtNormalTertiary: Color.lerp(txtNormalTertiary, other.txtNormalTertiary, t)!,
      txtNormalDisabled: Color.lerp(txtNormalDisabled, other.txtNormalDisabled, t)!,
      txtNormalBrand: Color.lerp(txtNormalBrand, other.txtNormalBrand, t)!,
      txtStatusSuccess: Color.lerp(txtStatusSuccess, other.txtStatusSuccess, t)!,
      txtInversePrimary: Color.lerp(txtInversePrimary, other.txtInversePrimary, t)!,
      txtInverseSecondary: Color.lerp(txtInverseSecondary, other.txtInverseSecondary, t)!,
      txtInverseDisabled: Color.lerp(txtInverseDisabled, other.txtInverseDisabled, t)!,
      txtStatusDanger: Color.lerp(txtStatusDanger, other.txtStatusDanger, t)!,
      txtStatusWarning: Color.lerp(txtStatusWarning, other.txtStatusWarning, t)!,
      icNormalPrimary: Color.lerp(icNormalPrimary, other.icNormalPrimary, t)!,
      icNormalSecondary: Color.lerp(icNormalSecondary, other.icNormalSecondary, t)!,
      icNormalDisabled: Color.lerp(icNormalDisabled, other.icNormalDisabled, t)!,
      icNormalTertiary: Color.lerp(icNormalTertiary, other.icNormalTertiary, t)!,
      icNormalBrand: Color.lerp(icNormalBrand, other.icNormalBrand, t)!,
      icInversePrimary: Color.lerp(icInversePrimary, other.icInversePrimary, t)!,
      icInverseSecondary: Color.lerp(icInverseSecondary, other.icInverseSecondary, t)!,
      icInverseDisabled: Color.lerp(icInverseDisabled, other.icInverseDisabled, t)!,
      icInverseTertiary: Color.lerp(icInverseTertiary, other.icInverseTertiary, t)!,
      icStatusSuccess: Color.lerp(icStatusSuccess, other.icStatusSuccess, t)!,
      icStatusInfo: Color.lerp(icStatusInfo, other.icStatusInfo, t)!,
      icStatusDanger: Color.lerp(icStatusDanger, other.icStatusDanger, t)!,
      icStatusWarning: Color.lerp(icStatusWarning, other.icStatusWarning, t)!,
      bgSurfaceMain: Color.lerp(bgSurfaceMain, other.bgSurfaceMain, t)!,
      bgSurfaceSf1: Color.lerp(bgSurfaceSf1, other.bgSurfaceSf1, t)!,
      bgSurfaceSf2: Color.lerp(bgSurfaceSf2, other.bgSurfaceSf2, t)!,
      bgSurfaceSf3: Color.lerp(bgSurfaceSf3, other.bgSurfaceSf3, t)!,
      bgSurfaceDisabled: Color.lerp(bgSurfaceDisabled, other.bgSurfaceDisabled, t)!,
      bgSurfaceInverseMain: Color.lerp(bgSurfaceInverseMain, other.bgSurfaceInverseMain, t)!,
      bgSurfaceInverseSf1: Color.lerp(bgSurfaceInverseSf1, other.bgSurfaceInverseSf1, t)!,
      bgSurfaceInverseSf2: Color.lerp(bgSurfaceInverseSf2, other.bgSurfaceInverseSf2, t)!,
      bgDecorBrandDarker: Color.lerp(bgDecorBrandDarker, other.bgDecorBrandDarker, t)!,
      bgDecorBrandBase: Color.lerp(bgDecorBrandBase, other.bgDecorBrandBase, t)!,
      bgDecorBrandLighter: Color.lerp(bgDecorBrandLighter, other.bgDecorBrandLighter, t)!,
      bgDecorBrandLightest: Color.lerp(bgDecorBrandLightest, other.bgDecorBrandLightest, t)!,
      bgStatusSuccess: Color.lerp(bgStatusSuccess, other.bgStatusSuccess, t)!,
      bgStatusInfo: Color.lerp(bgStatusInfo, other.bgStatusInfo, t)!,
      bgStatusWarning: Color.lerp(bgStatusWarning, other.bgStatusWarning, t)!,
      bgStatusDanger: Color.lerp(bgStatusDanger, other.bgStatusDanger, t)!,
      bgStatusDelete: Color.lerp(bgStatusDelete, other.bgStatusDelete, t)!,
      bdSurfaceMain: Color.lerp(bdSurfaceMain, other.bdSurfaceMain, t)!,
      bdSurfaceSf2: Color.lerp(bdSurfaceSf2, other.bdSurfaceSf2, t)!,
      bdSurfaceSf3: Color.lerp(bdSurfaceSf3, other.bdSurfaceSf3, t)!,
      bdSurfaceInverseMain: Color.lerp(bdSurfaceInverseMain, other.bdSurfaceInverseMain, t)!,
      bdSurfaceInverseSf1: Color.lerp(bdSurfaceInverseSf1, other.bdSurfaceInverseSf1, t)!,
      bdDecorBrandDarker: Color.lerp(bdDecorBrandDarker, other.bdDecorBrandDarker, t)!,
      bdDecorBrandBase: Color.lerp(bdDecorBrandBase, other.bdDecorBrandBase, t)!,
      bdDecorBrandLighter: Color.lerp(bdDecorBrandLighter, other.bdDecorBrandLighter, t)!,
      bdStatusSuccess: Color.lerp(bdStatusSuccess, other.bdStatusSuccess, t)!,
      bdStatusInfo: Color.lerp(bdStatusInfo, other.bdStatusInfo, t)!,
      bdStatusWarning: Color.lerp(bdStatusWarning, other.bdStatusWarning, t)!,
      bdStatusDanger: Color.lerp(bdStatusDanger, other.bdStatusDanger, t)!,
    );
  }
}

extension ColorSchemeBuilder on AppColors {
  ColorScheme toColorScheme(Brightness brightness) => ColorScheme(
        brightness: brightness,
        primary: txtNormalPrimary,
        secondary: txtInversePrimary,
        surface: bgSurfaceMain,
        background: bgSurfaceSf1,
        error: txtStatusDanger,
        onPrimary: txtNormalBrand,
        onSecondary: txtNormalBrand,
        onSurface: txtNormalPrimary,
        onBackground: txtNormalPrimary,
        onError: txtNormalPrimary,
      );
}
