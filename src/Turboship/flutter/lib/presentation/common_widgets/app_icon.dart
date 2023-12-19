import 'package:flutter/material.dart';

import '../../core/extensions/all.dart';
import '../resource/all.dart';

class AppIcon extends StatelessWidget {
  final Object icon;

  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  const AppIcon({
    required this.icon,
    super.key,
    this.color,
    this.backgroundColor,
    this.size = Sizes.s16,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget;

    final iconColor = color ?? context.colorTheme.icNormalPrimary;
    if (icon is IconData) {
      iconWidget = Icon(
        icon as IconData,
        color: iconColor,
        size: size,
      );
    } else if (icon is SvgGenImage) {
      iconWidget = (icon as SvgGenImage).svg(
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      );
    } else if (icon is AssetGenImage) {
      iconWidget = (icon as AssetGenImage).image(
        width: size,
        height: size,
      );
    } else if (icon is Widget) {
      iconWidget = icon as Widget;
    } else {
      throw Exception('Invalid icon type');
    }

    if (padding != null) {
      iconWidget = Padding(
        padding: padding!,
        child: iconWidget,
      );
    }

    if (onTap != null) {
      return iconWidget.clickable(onTap!);
    }

    return iconWidget;
  }
}

class AppIcons {
  static SvgGenImage close = Assets.icons.close;

  static SvgGenImage arrowBack = Assets.icons.arrowBack;
  static SvgGenImage arrowRight = Assets.icons.arrowRight;
  static SvgGenImage chevronLeft = Assets.icons.chevronLeft;
  static SvgGenImage chevronRight = Assets.icons.chevronRight;
  static SvgGenImage eye = Assets.icons.eye;
  static SvgGenImage eyeOff = Assets.icons.eyeOff;
  static SvgGenImage home = Assets.icons.home;
  static SvgGenImage bell = Assets.icons.bell;
  static SvgGenImage menu = Assets.icons.menu;
  static SvgGenImage check = Assets.icons.check;
  static SvgGenImage checkCircle = Assets.icons.checkCircle;
  static SvgGenImage oneSafe = Assets.icons.piggyBank;
  static SvgGenImage oneTrack = Assets.icons.chartArrowGrow;
  static SvgGenImage oneHedge = Assets.icons.pieChart;
  static SvgGenImage oneStock = Assets.icons.chartCandlestick;
  static SvgGenImage oneFam = Assets.icons.family;
  static SvgGenImage oneReti = Assets.icons.handsHeart;
  static SvgGenImage minus = Assets.icons.minus;
  static SvgGenImage plus = Assets.icons.plus;
  static SvgGenImage info = Assets.icons.info;
  static SvgGenImage exclamation = Assets.icons.exclamationCircle;
  static SvgGenImage qrCode = Assets.icons.qrcode;
  static SvgGenImage download = Assets.icons.download;
  static SvgGenImage copy = Assets.icons.copy;
  static SvgGenImage pencil = Assets.icons.pencil;
  static SvgGenImage search = Assets.icons.search;
  static SvgGenImage user = Assets.icons.user;
  static SvgGenImage lock = Assets.icons.lock;
  static SvgGenImage gift = Assets.icons.gift;
  static SvgGenImage smile = Assets.icons.smile;
  static SvgGenImage help = Assets.icons.help;
  static SvgGenImage calendar = Assets.icons.calendar;
  static SvgGenImage alertTriangle = Assets.icons.alertTriangle;
  static SvgGenImage share = Assets.icons.share;
  static SvgGenImage bank = Assets.icons.bank;
  static SvgGenImage history = Assets.icons.history;
  static SvgGenImage delete = Assets.icons.delete;
  const AppIcons._();
}
