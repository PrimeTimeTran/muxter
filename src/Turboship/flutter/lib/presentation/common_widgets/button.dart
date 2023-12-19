import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/extensions/text_style_extensions.dart';
import '../resource/all.dart';
import 'all.dart';

enum AppButtonSize { small, medium, large }

enum AppButtonType {
  primary,
  flatGold,
  flatGrey,
  outline,
  invisible,
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.type,
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.isDisabled = false,
    this.padding,
    this.size,
    this.bgColor,
    this.bdColor,
    this.textColor,
  }) : assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const AppButton.primary({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.isDisabled = false,
    this.padding,
    this.size,
    this.bgColor,
    this.bdColor,
    this.textColor,
  })  : type = AppButtonType.primary,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const AppButton.outline({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.isDisabled = false,
    this.padding,
    this.size,
    this.bgColor,
    this.bdColor,
    this.textColor,
  })  : type = AppButtonType.outline,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const AppButton.flatGold({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.isDisabled = false,
    this.padding,
    this.bgColor,
    this.bdColor,
    this.textColor,
    this.size,
  })  : type = AppButtonType.flatGold,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const AppButton.flatGrey({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.isDisabled = false,
    this.padding,
    this.bgColor,
    this.bdColor,
    this.textColor,
    this.size,
  })  : type = AppButtonType.flatGrey,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const AppButton.invisible({
    super.key,
    this.label,
    this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.isDisabled = false,
    this.padding,
    this.bgColor,
    this.bdColor,
    this.textColor,
    this.size,
  })  : type = AppButtonType.invisible,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  final String? label;
  final Object? icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isLoading;
  final EdgeInsets? padding;
  final AppButtonSize? size;
  final AppButtonType type;
  final bool isDisabled;
  final Color? bgColor;
  final Color? bdColor;
  final Color? textColor;

  final AppButtonSize _defaultSize = AppButtonSize.large;
  final double _defaultRadius = 6.0;

  @override
  Widget build(BuildContext context) {
    final textColor = _getTextColor(context);

    final textStyles = context.textTheme.b14BaseMedium.toColor(textColor);

    final child = isLoading
        ? _buildLoading(textColor)
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                AppIcon(
                  icon: icon!,
                  color: textColor,
                ),
              if (icon != null && label != null) AppSpacing.gapW8,
              if (label != null)
                Text(
                  label!,
                  textAlign: TextAlign.center,
                  style: textStyles,
                ),
            ],
          );

    final fgColor = this.bgColor ?? _getFgColor(context);
    final bgColor = _getBgColor(context);

    final finalBorderRadius = BorderRadius.circular(borderRadius ?? _defaultRadius);
    final finalPadding = _getPaddingBySize();

    final button = type != AppButtonType.outline
        ? FilledButton(
            style: FilledButton.styleFrom(
              foregroundColor: fgColor,
              backgroundColor: bgColor,
              disabledBackgroundColor: bgColor,
              disabledForegroundColor: fgColor,
              padding: finalPadding,
              elevation: type == AppButtonType.primary && !isDisabled ? 1 : 0,
            ).copyWith(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: finalBorderRadius),
              ),
            ),
            onPressed: isDisabled ? null : onPressed,
            child: child,
          )
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: _getBorderColor(context)),
              foregroundColor: bgColor,
              disabledBackgroundColor: bgColor,
              disabledForegroundColor: fgColor,
              shape: RoundedRectangleBorder(
                borderRadius: finalBorderRadius,
                side: BorderSide(color: _getBorderColor(context)),
              ),
              padding: finalPadding,
            ),
            onPressed: isDisabled ? null : onPressed,
            child: child,
          );

    return SizedBox(
      width: width,
      height: height,
      child: button,
    );
  }

  Widget _buildLoading(Color color) {
    return AppDefaultLoading(
      color: color,
      size: Sizes.s20,
    );
  }

  Color _getTextColor(BuildContext context) {
    if (textColor != null) {
      return textColor!;
    }

    final appColors = context.colorTheme;

    if (isDisabled) {
      return appColors.txtNormalDisabled;
    }

    switch (type) {
      case AppButtonType.primary:
        return appColors.txtInversePrimary;
      case AppButtonType.flatGold:
        return appColors.txtNormalBrand;
      case AppButtonType.flatGrey:
        return appColors.txtNormalPrimary;
      case AppButtonType.outline:
        return appColors.txtNormalBrand;
      case AppButtonType.invisible:
        return appColors.txtNormalPrimary;
    }
  }

  Color _getBgColor(BuildContext context) {
    if (bgColor != null) {
      return bgColor!;
    }

    final appColors = context.colorTheme;

    if (isDisabled) {
      return appColors.bgSurfaceDisabled;
    }

    switch (type) {
      case AppButtonType.primary:
        return appColors.bgSurfaceInverseMain;
      case AppButtonType.flatGold:
        return appColors.bgDecorBrandLightest;
      case AppButtonType.flatGrey:
        return appColors.bgSurfaceSf1;
      case AppButtonType.outline:
        return appColors.bgSurfaceMain;
      case AppButtonType.invisible:
        return Colors.transparent;
    }
  }

  Color _getFgColor(BuildContext context) {
    final appColors = context.colorTheme;

    if (isDisabled) {
      return appColors.bgSurfaceDisabled;
    }

    switch (type) {
      case AppButtonType.primary:
        return appColors.bgDecorBrandBase;
      case AppButtonType.flatGold:
        return appColors.bgDecorBrandLighter;
      case AppButtonType.flatGrey:
        return appColors.bgSurfaceSf2;
      case AppButtonType.outline:
        return appColors.bgDecorBrandLighter;
      case AppButtonType.invisible:
        return appColors.bgSurfaceSf1;
    }
  }

  EdgeInsetsGeometry _getPaddingBySize() {
    if (padding != null) {
      return padding!;
    }

    final buttonSize = size ?? _defaultSize;

    switch (buttonSize) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: Sizes.s12,
          vertical: 6.0,
        );
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: Sizes.s12,
          vertical: 10.0,
        );
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: Sizes.s12,
          vertical: 14.0,
        );
    }
  }

  Color _getBorderColor(BuildContext context) {
    if (bdColor != null) {
      return bdColor!;
    }

    final appColors = context.colorTheme;

    if (isDisabled) {
      return appColors.bgSurfaceDisabled;
    }

    switch (type) {
      case AppButtonType.outline:
        return appColors.bdDecorBrandLighter;
      default:
        return Colors.transparent;
    }
  }
}
