import 'package:flutter/material.dart';

import '../../core/extensions/all.dart';
import '../resource/styles/gaps.dart';

class DotIndicator extends StatelessWidget {
  final double size;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  const DotIndicator({
    super.key,
    this.size = Sizes.s4,
    this.color,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: Sizes.s4,
      height: Sizes.s24,
      decoration: BoxDecoration(
        color: color ?? context.colorTheme.bgSurfaceSf3,
        shape: BoxShape.circle,
      ),
    );
  }
}
