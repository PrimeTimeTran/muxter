import 'package:flutter/material.dart';

class B10xs {
  static const _package = 'theme';

  final TextStyle b10XsSemiBold;
  final TextStyle b10XsMedium;

  final TextStyle b10XsRegular;
  factory B10xs() => const B10xs.create(
        b10XsSemiBold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 10,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.4, // 14px
        ),
        b10XsMedium: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 10,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.4, // 14px
        ),
        b10XsRegular: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.4, // 14px
        ),
      );
  const B10xs.create({
    required this.b10XsSemiBold,
    required this.b10XsMedium,
    required this.b10XsRegular,
  });
}

class B12sm {
  static const _package = 'theme';

  final TextStyle b12SmSemiBold;

  final TextStyle b12SmMedium;

  final TextStyle b12SmRegular;
  final TextStyle b12SmItalic;
  final TextStyle b12SmCaps;
  factory B12sm() => const B12sm.create(
        b12SmSemiBold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.33, // 16px
        ),
        b12SmMedium: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.33, // 16px
        ),
        b12SmRegular: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.33, // 16px
        ),
        b12SmItalic: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.33, // 16px
        ),
        b12SmCaps: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          height: 1.33, // 16px
        ),
      );
  const B12sm.create({
    required this.b12SmSemiBold,
    required this.b12SmMedium,
    required this.b12SmRegular,
    required this.b12SmItalic,
    required this.b12SmCaps,
  });
}

class B14base {
  static const _package = 'theme';

  final TextStyle b14BaseSemiBold;

  final TextStyle b14BaseMedium;

  final TextStyle b14BaseRegular;
  final TextStyle b14BaseItalic;
  final TextStyle b14BaseCaps;
  factory B14base() => const B14base.create(
        b14BaseSemiBold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.43, // 20px
        ),
        b14BaseMedium: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.43, // 20px
        ),
        b14BaseRegular: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.43, // 20px
        ),
        b14BaseItalic: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.43, // 20px
        ),
        b14BaseCaps: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          height: 1.43, // 20px
        ),
      );
  const B14base.create({
    required this.b14BaseSemiBold,
    required this.b14BaseMedium,
    required this.b14BaseRegular,
    required this.b14BaseItalic,
    required this.b14BaseCaps,
  });
}

class B16lg {
  static const _package = 'theme';

  final TextStyle b16LgSemiBold;

  final TextStyle b16LgMedium;

  final TextStyle b16LgRegular;
  final TextStyle b16LgItalic;
  final TextStyle b16LgCaps;
  factory B16lg() => const B16lg.create(
        b16LgSemiBold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.5, // 24px
        ),
        b16LgMedium: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          height: 1.5, // 24px
        ),
        b16LgRegular: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.5, // 24px
        ),
        b16LgItalic: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          height: 1.5, // 24px
        ),
        b16LgCaps: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          height: 1.5, // 24px
        ),
      );
  const B16lg.create({
    required this.b16LgSemiBold,
    required this.b16LgMedium,
    required this.b16LgRegular,
    required this.b16LgItalic,
    required this.b16LgCaps,
  });
}

class BdScheme {
  const BdScheme({
    required this.surfaceMain,
    required this.surfaceSf2,
    required this.surfaceSf3,
    required this.surfaceDisabled,
    required this.surfaceInverseMain,
    required this.surfaceInverseSf1,
    required this.decorBrandBase,
    required this.decorBrandDarker,
    required this.decorBrandLighter,
    required this.statusDanger,
    required this.statusInfo,
    required this.statusSuccess,
    required this.statusWarning,
  });

  const BdScheme.light()
      : decorBrandBase = const Color(0xffDFA753),
        decorBrandDarker = const Color(0xff764110),
        decorBrandLighter = const Color(0xffF0E5D5),
        statusDanger = const Color(0xffE84C4C),
        statusInfo = const Color(0xff368BE5),
        statusSuccess = const Color(0xff82C42E),
        statusWarning = const Color(0xffD7854A),
        surfaceDisabled = const Color(0xffECEDEE),
        surfaceInverseMain = const Color(0xff292929),
        surfaceInverseSf1 = const Color(0xffFFFFFF),
        surfaceMain = const Color(0xffECEDEE),
        surfaceSf2 = const Color(0xffE2E3E4),
        surfaceSf3 = const Color(0xffC0C0C0);

  const BdScheme.dark()
      : decorBrandBase = const Color(0xffDFA753),
        decorBrandDarker = const Color(0xff753700),
        decorBrandLighter = const Color(0xffF0E5D5),
        statusDanger = const Color(0xffE84C4C),
        statusInfo = const Color(0xff368BE5),
        statusSuccess = const Color(0xff82C42E),
        statusWarning = const Color(0xffD7854A),
        surfaceDisabled = const Color(0xff363636),
        surfaceInverseMain = const Color(0xffECEDEE),
        surfaceInverseSf1 = const Color(0xffECEDEE),
        surfaceMain = const Color(0xff212121),
        surfaceSf2 = const Color(0xffFFFFFF),
        surfaceSf3 = const Color(0xffFFFFFF);

  final Color surfaceSf2;
  final Color surfaceSf3;
  final Color surfaceDisabled;
  final Color surfaceInverseMain;
  final Color surfaceInverseSf1;
  final Color decorBrandBase;
  final Color decorBrandDarker;
  final Color decorBrandLighter;
  final Color statusDanger;
  final Color statusInfo;
  final Color statusSuccess;
  final Color statusWarning;
  final Color surfaceMain;
}

class BgScheme {
  const BgScheme({
    required this.decorBrandBase,
    required this.decorBrandDarker,
    required this.decorBrandLighter,
    required this.decorBrandLightest,
    required this.statusDanger,
    required this.statusDelete,
    required this.statusInfo,
    required this.statusSuccess,
    required this.statusWarning,
    required this.surfaceDisabled,
    required this.surfaceInverseDisabled,
    required this.surfaceInverseMain,
    required this.surfaceInverseSf1,
    required this.surfaceInverseSf2,
    required this.surfaceInverseSf3,
    required this.surfaceMain,
    required this.surfaceSf1,
    required this.surfaceSf2,
    required this.surfaceSf3,
  });

  const BgScheme.light()
      : decorBrandBase = const Color(0xffDFA753),
        decorBrandDarker = const Color(0xff764110),
        decorBrandLighter = const Color(0xffF0E5D5),
        decorBrandLightest = const Color(0xffFCF7F0),
        statusDanger = const Color(0xffFADBDB),
        statusDelete = const Color(0xffE84C4C),
        statusInfo = const Color(0xffD7E8FA),
        statusSuccess = const Color(0xffE6F3D5),
        statusWarning = const Color(0xffF7E7DB),
        surfaceDisabled = const Color(0xffECEDEE),
        surfaceInverseDisabled = const Color(0xff171717),
        surfaceInverseMain = const Color(0xff171717),
        surfaceInverseSf1 = const Color(0xffFFFFFF),
        surfaceInverseSf2 = const Color(0xffFFFFFF),
        surfaceInverseSf3 = const Color(0xffFFFFFF),
        surfaceMain = const Color(0xffFFFFFF),
        surfaceSf1 = const Color(0xffF8F8F8),
        surfaceSf2 = const Color(0xffECEDEE),
        surfaceSf3 = const Color(0xffE2E3E4);

  const BgScheme.dark()
      : decorBrandBase = const Color(0xffDFA753),
        decorBrandDarker = const Color(0xff753700),
        decorBrandLighter = const Color(0xffF0E5D5),
        decorBrandLightest = const Color(0xffFCF7F0),
        statusDanger = const Color(0xffFADBDB),
        statusDelete = const Color(0xffFFFFFF),
        statusInfo = const Color(0xffD7E8FA),
        statusSuccess = const Color(0xffE6F3D5),
        statusWarning = const Color(0xffF7E7DB),
        surfaceDisabled = const Color(0xff1A1A1A),
        surfaceInverseDisabled = const Color(0xffECEDEE),
        surfaceInverseMain = const Color(0xffFFFFFF),
        surfaceInverseSf1 = const Color(0xffF8F8F8),
        surfaceInverseSf2 = const Color(0xffECEDEE),
        surfaceInverseSf3 = const Color(0xffE2E3E4),
        surfaceMain = const Color(0xff1A1A1A),
        surfaceSf1 = const Color(0xffFFFFFF),
        surfaceSf2 = const Color(0xffFFFFFF),
        surfaceSf3 = const Color(0xffFFFFFF);

  final Color decorBrandBase;
  final Color decorBrandDarker;
  final Color decorBrandLighter;
  final Color decorBrandLightest;
  final Color statusDanger;
  final Color statusDelete;
  final Color statusInfo;
  final Color statusSuccess;
  final Color statusWarning;
  final Color surfaceDisabled;
  final Color surfaceInverseDisabled;
  final Color surfaceInverseMain;
  final Color surfaceInverseSf1;
  final Color surfaceInverseSf2;
  final Color surfaceInverseSf3;
  final Color surfaceMain;
  final Color surfaceSf1;
  final Color surfaceSf2;
  final Color surfaceSf3;
}

class BlueScheme {
  final Color $100;

  final Color $1000;

  final Color $1100;
  final Color $200;
  final Color $300;
  final Color $400;
  final Color $500;
  final Color $600;
  final Color $700;
  final Color $800;
  final Color $900;
  const BlueScheme({
    required this.$100,
    required this.$1000,
    required this.$1100,
    required this.$200,
    required this.$300,
    required this.$400,
    required this.$500,
    required this.$600,
    required this.$700,
    required this.$800,
    required this.$900,
  });
  const BlueScheme.light()
      : $100 = const Color(0xffD7E8FA),
        $1000 = const Color(0xff122E4C),
        $1100 = const Color(0xff0B1C2E),
        $200 = const Color(0xffBCD8F6),
        $300 = const Color(0xff9AC5F2),
        $400 = const Color(0xff79B2EE),
        $500 = const Color(0xff589EE9),
        $600 = const Color(0xff368BE5),
        $700 = const Color(0xff2D74BF),
        $800 = const Color(0xff245D99),
        $900 = const Color(0xff1B4673);
}

class BorderScheme {
  final double $12;

  final double $20;

  final double $8;
  const BorderScheme({
    required this.$12,
    required this.$20,
    required this.$8,
  });
  const BorderScheme.value()
      : $12 = 12,
        $20 = 20,
        $8 = 8;
}

class BrandScheme {
  final Color goldBase;

  final Color goldDarker;

  final Color goldDarkest;
  final Color goldLighter;
  final Color goldLightest;
  const BrandScheme({
    required this.goldBase,
    required this.goldDarker,
    required this.goldDarkest,
    required this.goldLighter,
    required this.goldLightest,
  });
  const BrandScheme.mode1()
      : goldBase = const Color(0xffDFA753),
        goldDarker = const Color(0xff764110),
        goldDarkest = const Color(0xff5C1E00),
        goldLighter = const Color(0xffF0E5D5),
        goldLightest = const Color(0xffFCF7F0);
}

class CardScheme {
  final double cornerLg;

  final double cornerSm;

  final double padLR;
  final double padTB;
  const CardScheme({
    required this.cornerLg,
    required this.cornerSm,
    required this.padLR,
    required this.padTB,
  });
  const CardScheme.mode1()
      : cornerLg = 12,
        cornerSm = 8,
        padLR = 16,
        padTB = 16;
}

class GoldScheme {
  final Color $100;

  final Color $1000;

  final Color $1100;
  final Color $1200;
  final Color $1300;
  final Color $1400;
  final Color $1500;
  final Color $1600;
  final Color $1700;
  final Color $1800;
  final Color $200;
  final Color $300;
  final Color $400;
  final Color $500;
  final Color $600;
  final Color $700;
  final Color $800;
  final Color $900;
  const GoldScheme({
    required this.$100,
    required this.$1000,
    required this.$1100,
    required this.$1200,
    required this.$1300,
    required this.$1400,
    required this.$1500,
    required this.$1600,
    required this.$1700,
    required this.$1800,
    required this.$200,
    required this.$300,
    required this.$400,
    required this.$500,
    required this.$600,
    required this.$700,
    required this.$800,
    required this.$900,
  });
  const GoldScheme.light()
      : $100 = const Color(0xffFCF7F0),
        $1000 = const Color(0xffDB9D40),
        $1100 = const Color(0xffC18327),
        $1200 = const Color(0xffA86A0D),
        $1300 = const Color(0xff8E5100),
        $1400 = const Color(0xff764110),
        $1500 = const Color(0xff5C1E00),
        $1600 = const Color(0xff420400),
        $1700 = const Color(0xff290000),
        $1800 = const Color(0xff0F0000),
        $200 = const Color(0xffF0E5D5),
        $300 = const Color(0xffF4E2C6),
        $400 = const Color(0xffF1D8B3),
        $500 = const Color(0xffEDCE9F),
        $600 = const Color(0xffE9C48C),
        $700 = const Color(0xffE6BA79),
        $800 = const Color(0xffE2B166),
        $900 = const Color(0xffDFA753);
}

class GreySolidScheme {
  final Color $0;

  final Color $100;

  final Color $1000;
  final Color $1100;
  final Color $1200;
  final Color $1300;
  final Color $200;
  final Color $300;
  final Color $400;
  final Color $500;
  final Color $600;
  final Color $700;
  final Color $800;
  final Color $900;
  const GreySolidScheme({
    required this.$0,
    required this.$100,
    required this.$1000,
    required this.$1100,
    required this.$1200,
    required this.$1300,
    required this.$200,
    required this.$300,
    required this.$400,
    required this.$500,
    required this.$600,
    required this.$700,
    required this.$800,
    required this.$900,
  });
  const GreySolidScheme.light()
      : $0 = const Color(0xffFFFFFF),
        $100 = const Color(0xffF8F8F8),
        $1000 = const Color(0xff434343),
        $1100 = const Color(0xff292929),
        $1200 = const Color(0xff171717),
        $1300 = const Color(0xff000000),
        $200 = const Color(0xffECEDEE),
        $300 = const Color(0xffE2E3E4),
        $400 = const Color(0xffC0C0C0),
        $500 = const Color(0xffABABAB),
        $600 = const Color(0xff969696),
        $700 = const Color(0xff818181),
        $800 = const Color(0xff6C6C6C),
        $900 = const Color(0xff585858);
}

class Heading {
  static const _package = 'theme';

  final TextStyle headingDisplaySemibold;

  final TextStyle headingH15xlSemibold;

  final TextStyle headingH24xlSemibold;
  final TextStyle headingH33xlSemibold;
  final TextStyle headingH42xlSemibold;
  factory Heading() => const Heading.create(
        headingDisplaySemibold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 36,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.11, // 40px
        ),
        headingH15xlSemibold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 30,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.2, // 36px
        ),
        headingH24xlSemibold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: -0.36,
          height: 1.33, // 32px
        ),
        headingH33xlSemibold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: -0.2,
          height: 1.4, // 28px
        ),
        headingH42xlSemibold: TextStyle(
          package: _package,
          fontFamily: 'Inter',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          height: 1.56, // 28px
        ),
      );
  const Heading.create({
    required this.headingDisplaySemibold,
    required this.headingH15xlSemibold,
    required this.headingH24xlSemibold,
    required this.headingH33xlSemibold,
    required this.headingH42xlSemibold,
  });
}

class IcScheme {
  const IcScheme({
    required this.inverseDisabled,
    required this.inversePrimary,
    required this.inverseSecondary,
    required this.inverseTertiary,
    required this.normalBrand,
    required this.normalBrandHighlight,
    required this.normalDisabled,
    required this.normalPrimary,
    required this.normalSecondary,
    required this.normalTertiary,
    required this.statusDanger,
    required this.statusInfo,
    required this.statusSuccess,
    required this.statusWarning,
  });

  const IcScheme.light()
      : inverseDisabled = const Color(0xffFFFFFF),
        inversePrimary = const Color(0xffFFFFFF),
        inverseSecondary = const Color(0xffFFFFFF),
        inverseTertiary = const Color(0xffFFFFFF),
        normalBrand = const Color(0xff764110),
        normalBrandHighlight = const Color(0xffDFA753),
        normalDisabled = const Color(0xffC0C0C0),
        normalPrimary = const Color(0xff292929),
        normalSecondary = const Color(0xff585858),
        normalTertiary = const Color(0xff969696),
        statusDanger = const Color(0xffE84C4C),
        statusInfo = const Color(0xff368BE5),
        statusSuccess = const Color(0xff82C42E),
        statusWarning = const Color(0xffD7854A);

  const IcScheme.dark()
      : inverseDisabled = const Color(0xffBABBBC),
        inversePrimary = const Color(0xff262626),
        inverseSecondary = const Color(0xff4A4D4F),
        inverseTertiary = const Color(0xff8D8E8F),
        normalBrand = const Color(0xff753700),
        normalBrandHighlight = const Color(0xffDFA753),
        normalDisabled = const Color(0xffFFFFFF),
        normalPrimary = const Color(0xffFFFFFF),
        normalSecondary = const Color(0xffFFFFFF),
        normalTertiary = const Color(0xffFFFFFF),
        statusDanger = const Color(0xffE84C4C),
        statusInfo = const Color(0xff368BE5),
        statusSuccess = const Color(0xff82C42E),
        statusWarning = const Color(0xffD7854A);

  final Color inverseDisabled;
  final Color inversePrimary;
  final Color inverseSecondary;
  final Color inverseTertiary;
  final Color normalBrand;
  final Color normalBrandHighlight;
  final Color normalDisabled;
  final Color normalPrimary;
  final Color normalSecondary;
  final Color normalTertiary;
  final Color statusDanger;
  final Color statusInfo;
  final Color statusSuccess;
  final Color statusWarning;
}

class LimeScheme {
  final Color $100;

  final Color $1000;

  final Color $1100;
  final Color $200;
  final Color $300;
  final Color $400;
  final Color $500;
  final Color $600;
  final Color $700;
  final Color $800;
  final Color $900;
  const LimeScheme({
    required this.$100,
    required this.$1000,
    required this.$1100,
    required this.$200,
    required this.$300,
    required this.$400,
    required this.$500,
    required this.$600,
    required this.$700,
    required this.$800,
    required this.$900,
  });
  const LimeScheme.light()
      : $100 = const Color(0xffE6F3D5),
        $1000 = const Color(0xff2B410F),
        $1100 = const Color(0xff1A2709),
        $200 = const Color(0xffD5EBB9),
        $300 = const Color(0xffC1E196),
        $400 = const Color(0xffACD874),
        $500 = const Color(0xff97CE51),
        $600 = const Color(0xff82C42E),
        $700 = const Color(0xff6CA326),
        $800 = const Color(0xff57831F),
        $900 = const Color(0xff416217);
}

class LinkScheme {
  final Color defaultColor;

  final Color disabled;

  final Color hover;

  final Color pressed;
  final Color visited;
  const LinkScheme({
    required this.defaultColor,
    required this.disabled,
    required this.hover,
    required this.pressed,
    required this.visited,
  });
  const LinkScheme.dark()
      : defaultColor = const Color(0xff753700),
        disabled = const Color(0xffFFFFFF),
        hover = const Color(0xff753700),
        pressed = const Color(0xff290000),
        visited = const Color(0xff171717);
  const LinkScheme.light()
      : defaultColor = const Color(0xff764110),
        disabled = const Color(0xffC0C0C0),
        hover = const Color(0xff764110),
        pressed = const Color(0xff5C1E00),
        visited = const Color(0xff292929);
}

class OneLongColorsCore {
  final GreySolidScheme greySolidScheme;

  final GoldScheme goldScheme;

  final BlueScheme blueScheme;
  final OrangeScheme orangeScheme;
  final YellowScheme yellowScheme;
  final LimeScheme limeScheme;
  final RedScheme redScheme;
  final WhiteOpacityScheme whiteOpacityScheme;
  const OneLongColorsCore({
    required this.greySolidScheme,
    required this.goldScheme,
    required this.blueScheme,
    required this.orangeScheme,
    required this.yellowScheme,
    required this.limeScheme,
    required this.redScheme,
    required this.whiteOpacityScheme,
  });
  const OneLongColorsCore.light()
      : greySolidScheme = const GreySolidScheme.light(),
        goldScheme = const GoldScheme.light(),
        blueScheme = const BlueScheme.light(),
        orangeScheme = const OrangeScheme.light(),
        yellowScheme = const YellowScheme.light(),
        limeScheme = const LimeScheme.light(),
        redScheme = const RedScheme.light(),
        whiteOpacityScheme = const WhiteOpacityScheme.light();
}

class OneLongLEVEL1COLORS {
  final OverlayScheme overlayScheme;

  final StatusScheme statusScheme;

  final BrandScheme brandScheme;
  const OneLongLEVEL1COLORS({
    required this.overlayScheme,
    required this.statusScheme,
    required this.brandScheme,
  });
  const OneLongLEVEL1COLORS.mode1()
      : overlayScheme = const OverlayScheme.mode1(),
        statusScheme = const StatusScheme.mode1(),
        brandScheme = const BrandScheme.mode1();
}

class OneLongLEVEL1NUMBER {
  final double cornerTopPopOver;

  final double screenMargin;

  final CardScheme cardScheme;
  const OneLongLEVEL1NUMBER({
    required this.cornerTopPopOver,
    required this.screenMargin,
    required this.cardScheme,
  });
  const OneLongLEVEL1NUMBER.mode1()
      : cornerTopPopOver = 20,
        screenMargin = 20,
        cardScheme = const CardScheme.mode1();
}

class OneLongLEVEL2COLORS {
  final BgScheme bgScheme;
  final BdScheme bdScheme;
  final IcScheme icScheme;
  final TxtScheme txtScheme;

  const OneLongLEVEL2COLORS({
    required this.bgScheme,
    required this.bdScheme,
    required this.icScheme,
    required this.txtScheme,
  });
  const OneLongLEVEL2COLORS.dark()
      : bgScheme = const BgScheme.dark(),
        bdScheme = const BdScheme.dark(),
        icScheme = const IcScheme.dark(),
        txtScheme = const TxtScheme.dark();
  const OneLongLEVEL2COLORS.light()
      : bgScheme = const BgScheme.light(),
        bdScheme = const BdScheme.light(),
        icScheme = const IcScheme.light(),
        txtScheme = const TxtScheme.light();
}

class OneLongLEVEL3COLORS {
  final LinkScheme linkScheme;

  const OneLongLEVEL3COLORS({
    required this.linkScheme,
  });

  const OneLongLEVEL3COLORS.dark() : linkScheme = const LinkScheme.dark();

  const OneLongLEVEL3COLORS.light() : linkScheme = const LinkScheme.light();
}

class OneLongNumbersCore {
  final BorderScheme borderScheme;

  final SpaceScheme spaceScheme;

  const OneLongNumbersCore({
    required this.borderScheme,
    required this.spaceScheme,
  });
  const OneLongNumbersCore.value()
      : borderScheme = const BorderScheme.value(),
        spaceScheme = const SpaceScheme.value();
}

class OneLongTextTheme {
  static const _package = 'theme';

  final Heading heading;
  final B16lg b16lg;
  final B14base b14base;
  final B12sm b12sm;
  final B10xs b10xs;
  factory OneLongTextTheme() => OneLongTextTheme.create(
        heading: Heading(),
        b16lg: B16lg(),
        b14base: B14base(),
        b12sm: B12sm(),
        b10xs: B10xs(),
      );
  const OneLongTextTheme.create({
    required this.heading,
    required this.b16lg,
    required this.b14base,
    required this.b12sm,
    required this.b10xs,
  });
}

class OrangeScheme {
  final Color $100;

  final Color $1000;

  final Color $1100;
  final Color $200;
  final Color $300;
  final Color $400;
  final Color $500;
  final Color $600;
  final Color $700;
  final Color $800;
  final Color $900;
  const OrangeScheme({
    required this.$100,
    required this.$1000,
    required this.$1100,
    required this.$200,
    required this.$300,
    required this.$400,
    required this.$500,
    required this.$600,
    required this.$700,
    required this.$800,
    required this.$900,
  });
  const OrangeScheme.light()
      : $100 = const Color(0xffF7E7DB),
        $1000 = const Color(0xff482C19),
        $1100 = const Color(0xff2B1B0F),
        $200 = const Color(0xffF2D6C3),
        $300 = const Color(0xffEBC2A4),
        $400 = const Color(0xffE4AE86),
        $500 = const Color(0xffDE9968),
        $600 = const Color(0xffD7854A),
        $700 = const Color(0xffB36F3E),
        $800 = const Color(0xff8F5931),
        $900 = const Color(0xff6C4325);
}

class OverlayScheme {
  final Color black;

  const OverlayScheme({
    required this.black,
  });

  const OverlayScheme.mode1() : black = const Color(0xff000000);
}

class RedScheme {
  final Color $100;

  final Color $1000;

  final Color $1100;
  final Color $200;
  final Color $300;
  final Color $400;
  final Color $500;
  final Color $600;
  final Color $700;
  final Color $800;
  final Color $900;
  const RedScheme({
    required this.$100,
    required this.$1000,
    required this.$1100,
    required this.$200,
    required this.$300,
    required this.$400,
    required this.$500,
    required this.$600,
    required this.$700,
    required this.$800,
    required this.$900,
  });
  const RedScheme.light()
      : $100 = const Color(0xffFADBDB),
        $1000 = const Color(0xff4D1919),
        $1100 = const Color(0xff2E0F0F),
        $200 = const Color(0xffF7C3C3),
        $300 = const Color(0xffF3A5A5),
        $400 = const Color(0xffF08888),
        $500 = const Color(0xffEC6A6A),
        $600 = const Color(0xffE84C4C),
        $700 = const Color(0xffC13F3F),
        $800 = const Color(0xff9B3333),
        $900 = const Color(0xff742626);
}

class SpaceScheme {
  final double $16;

  final double $20;

  final double $8;
  const SpaceScheme({
    required this.$16,
    required this.$20,
    required this.$8,
  });
  const SpaceScheme.value()
      : $16 = 16,
        $20 = 20,
        $8 = 8;
}

class StatusScheme {
  final Color dangerBase;

  final Color dangerDarker;

  final Color dangerLighter;
  final Color successBase;
  final Color successDarker;
  final Color successLighter;
  final Color warningBase;
  final Color warningDarker;
  final Color warningLighter;
  const StatusScheme({
    required this.dangerBase,
    required this.dangerDarker,
    required this.dangerLighter,
    required this.successBase,
    required this.successDarker,
    required this.successLighter,
    required this.warningBase,
    required this.warningDarker,
    required this.warningLighter,
  });
  const StatusScheme.mode1()
      : dangerBase = const Color(0xffE84C4C),
        dangerDarker = const Color(0xffC13F3F),
        dangerLighter = const Color(0xffFADBDB),
        successBase = const Color(0xff82C42E),
        successDarker = const Color(0xff57831F),
        successLighter = const Color(0xffE6F3D5),
        warningBase = const Color(0xffD7854A),
        warningDarker = const Color(0xff6C4325),
        warningLighter = const Color(0xffF7E7DB);
}

class TxtScheme {
  const TxtScheme({
    required this.inverseDisabled,
    required this.inversePrimary,
    required this.inverseSecondary,
    required this.normalBrand,
    required this.normalDisabled,
    required this.normalPrimary,
    required this.normalSecondary,
    required this.normalTertiary,
    required this.statusDanger,
    required this.statusSuccess,
    required this.statusWarning,
  });

  const TxtScheme.light()
      : inverseDisabled = const Color(0xffFFFFFF),
        inversePrimary = const Color(0xffFFFFFF),
        inverseSecondary = const Color(0xffFFFFFF),
        normalBrand = const Color(0xff764110),
        normalDisabled = const Color(0xffC0C0C0),
        normalPrimary = const Color(0xff292929),
        normalSecondary = const Color(0xff585858),
        normalTertiary = const Color(0xff969696),
        statusDanger = const Color(0xffC13F3F),
        statusSuccess = const Color(0xff57831F),
        statusWarning = const Color(0xff6C4325);

  const TxtScheme.dark()
      : inverseDisabled = const Color(0xffBABBBC),
        inversePrimary = const Color(0xff313335),
        inverseSecondary = const Color(0xff4A4D4F),
        normalBrand = const Color(0xff764110),
        normalDisabled = const Color(0xffFFFFFF),
        normalPrimary = const Color(0xffFFFFFF),
        normalSecondary = const Color(0xffFFFFFF),
        normalTertiary = const Color(0xffFFFFFF),
        statusDanger = const Color(0xff742626),
        statusSuccess = const Color(0xff416217),
        statusWarning = const Color(0xff6C4325);

  final Color inverseDisabled;
  final Color inversePrimary;
  final Color inverseSecondary;
  final Color normalBrand;
  final Color normalDisabled;
  final Color normalPrimary;
  final Color normalSecondary;
  final Color normalTertiary;
  final Color statusDanger;
  final Color statusSuccess;
  final Color statusWarning;
}

class WhiteOpacityScheme {
  final Color $100;

  final Color $1000;

  final Color $150;
  final Color $200;
  final Color $300;
  final Color $400;
  final Color $50;
  final Color $500;
  final Color $600;
  final Color $700;
  final Color $800;
  final Color $900;
  const WhiteOpacityScheme({
    required this.$100,
    required this.$1000,
    required this.$150,
    required this.$200,
    required this.$300,
    required this.$400,
    required this.$50,
    required this.$500,
    required this.$600,
    required this.$700,
    required this.$800,
    required this.$900,
  });
  const WhiteOpacityScheme.light()
      : $100 = const Color(0xffFFFFFF),
        $1000 = const Color(0xffFFFFFF),
        $150 = const Color(0xffFFFFFF),
        $200 = const Color(0xffFFFFFF),
        $300 = const Color(0xffFFFFFF),
        $400 = const Color(0xffFFFFFF),
        $50 = const Color(0xffFFFFFF),
        $500 = const Color(0xffFFFFFF),
        $600 = const Color(0xffFFFFFF),
        $700 = const Color(0xffFFFFFF),
        $800 = const Color(0xffFFFFFF),
        $900 = const Color(0xffFFFFFF);
}

class YellowScheme {
  final Color $100;

  final Color $1000;

  final Color $1100;
  final Color $200;
  final Color $300;
  final Color $400;
  final Color $500;
  final Color $600;
  final Color $700;
  final Color $800;
  final Color $900;
  const YellowScheme({
    required this.$100,
    required this.$1000,
    required this.$1100,
    required this.$200,
    required this.$300,
    required this.$400,
    required this.$500,
    required this.$600,
    required this.$700,
    required this.$800,
    required this.$900,
  });
  const YellowScheme.light()
      : $100 = const Color(0xffFCF6D8),
        $1000 = const Color(0xff4F4715),
        $1100 = const Color(0xff302A0C),
        $200 = const Color(0xffF9F1BF),
        $300 = const Color(0xffF6E99E),
        $400 = const Color(0xffF4E27E),
        $500 = const Color(0xffF1DB5E),
        $600 = const Color(0xffEED43E),
        $700 = const Color(0xffC6B134),
        $800 = const Color(0xff9F8D29),
        $900 = const Color(0xff776A1F);
}
