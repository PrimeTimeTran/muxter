import 'package:flutter/material.dart';

import '../resource/all.dart';
import 'app_icon.dart';

class OLProductIcon extends StatelessWidget {
  final double size;
  final Color bgColor;
  final Color? bgColor2;
  final Widget child;
  const OLProductIcon({
    required this.size,
    required this.bgColor,
    required this.child,
    this.bgColor2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor2 == null ? bgColor : null,
        gradient: (bgColor2 != null)
            ? LinearGradient(
                colors: [
                  bgColor,
                  bgColor2!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: AppRadius.borderRadius6,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

// ignore: prefer-single-widget-per-file
class OneSafeIcon extends StatelessWidget {
  final double size;
  final double icSize;
  const OneSafeIcon({
    required this.size,
    required this.icSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OLProductIcon(
      size: size,
      bgColor: const Color(0xffFCF1E6),
      bgColor2: const Color(0xffFAE0C9),
      child: AppIcon(
        icon: AppIcons.oneSafe,
        size: Sizes.s20,
        color: const Color(0xffB26E2D),
      ),
    );
  }
}
