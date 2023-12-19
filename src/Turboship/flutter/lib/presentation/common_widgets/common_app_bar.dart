import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/all.dart';
import '../resource/styles/all.dart';
import 'all.dart';

enum AppBarTitle {
  text,
  none,
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  final VoidCallback? onLeadingPressed;
  final VoidCallback? onTitlePressed;
  final LeadingIcon leadingIcon;
  final AppBarTitle titleType;
  final bool? centerTitle;
  final double elevation;
  final List<Widget>? actions;
  final double? height;
  final bool automaticallyImplyLeading;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? drawer;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? leadingWidth;
  final TextStyle? titleTextStyle;
  final Color? leadingIconColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  @override
  final Size preferredSize;

  CommonAppBar({
    super.key,
    this.title,
    this.onLeadingPressed,
    this.onTitlePressed,
    this.leadingIcon = LeadingIcon.back,
    this.titleType = AppBarTitle.text,
    this.centerTitle,
    this.elevation = 0,
    this.actions,
    this.drawer,
    this.height,
    this.automaticallyImplyLeading = true,
    this.flexibleSpace,
    this.bottom,
    this.shadowColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.leadingWidth,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.leadingIconColor,
  }) : preferredSize = Size.fromHeight(height ?? Sizes.s56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading:
          leadingIcon != LeadingIcon.none ? automaticallyImplyLeading : false,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor ?? context.colorTheme.bgSurfaceMain,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      leadingWidth: leadingWidth,
      systemOverlayStyle: systemOverlayStyle,
      leading: leadingIcon == LeadingIcon.none
          ? null
          : _buildLeadingIcon().clickable(onLeadingPressed ?? context.pop),
      centerTitle: centerTitle,
      title: _buildTitle(context),
      actions: actions != null ? [...actions!, AppSpacing.gapW12] : null,
      elevation: elevation,
    );
  }

  Widget _buildLeadingIcon() {
    if (!automaticallyImplyLeading) {
      return AppSpacing.emptyBox;
    }

    if (leadingIcon == LeadingIcon.logo) {
      return _buildLeadingLogo();
    }

    Object? icon;
    switch (leadingIcon) {
      case LeadingIcon.back:
        icon = AppIcons.chevronLeft;
        break;
      case LeadingIcon.close:
        icon = AppIcons.close;
        break;
      default:
        break;
    }

    if (icon == null) {
      return AppSpacing.emptyBox;
    }

    return SizedBox(
      width: Sizes.s24,
      child: Center(
        child: AppIcon(
          icon: icon,
          color: leadingIconColor,
        ),
      ),
    );
  }

  Widget _buildLeadingLogo() {
    return const AppIcon(
      icon: Placeholder(),
      padding: AppSpacing.edgeInsetsOnlyLeft16,
    );
  }

  Widget _buildTitle(BuildContext context) {
    Widget? child = titleType == AppBarTitle.text
        ? Text(title ?? '', style: _getAppBarTextStyle(context))
        : null;

    if (child != null && leadingIcon == LeadingIcon.none) {
      child = Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: child,
      );
    }

    return GestureDetector(
      onTap: onTitlePressed,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }

  TextStyle _getAppBarTextStyle(BuildContext context) {
    if (titleTextStyle != null) {
      return titleTextStyle!;
    }

    return context.textTheme.headingH42xlSemibold;
  }
}

enum LeadingIcon {
  logo,
  back,
  close,
  none,
}
