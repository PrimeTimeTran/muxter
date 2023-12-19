import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/configs/di/di.dart';
import '../../core/extensions/all.dart';
import '../common_blocs/all.dart';
import '../common_widgets/all.dart';
import '../resource/all.dart';

class AppUtils {
  const AppUtils._();

  static Future<T?> showAlertDialog<T>(
    BuildContext context, {
    required String title,
    required String message,
    Widget? icon,
    String? positiveText,
    String? negativeText,
    VoidCallback? onPositivePressed,
    Color? positiveColor,
    Color? positiveTextColor,
    VoidCallback? onNegativePressed,
    Color? negativeColor,
    Color? negativeTextColor,
  }) {
    return showDialog<T>(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0)
                    .copyWith(top: 32.0),
            decoration: BoxDecoration(
              color: context.colorTheme.bgSurfaceMain,
              borderRadius: AppRadius.borderRadius8,
            ),
            child: IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (icon != null) ...[
                    icon,
                    AppSpacing.gapH20,
                  ],
                  Text(
                    title,
                    style: context.textTheme.b16LgSemiBold,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.gapH8,
                  Text(
                    message,
                    style: context.textTheme.b14BaseRegular
                        .tertiaryTextColor(context),
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.gapH28,
                  Row(
                    children: [
                      if (negativeText != null)
                        Expanded(
                          child: AppButton.outline(
                            label: negativeText,
                            onPressed: onNegativePressed ?? context.pop,
                            bdColor: negativeColor ??
                                context.colorTheme.bdSurfaceMain,
                            textColor: negativeTextColor ??
                                context.colorTheme.txtNormalPrimary,
                          ),
                        ),
                      if (negativeText != null && positiveText != null)
                        AppSpacing.gapW12,
                      if (positiveText != null)
                        Expanded(
                          child: AppButton.primary(
                            label: positiveText,
                            onPressed: onPositivePressed ?? context.pop,
                            bgColor: positiveColor,
                            textColor: positiveTextColor,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool enableDrag = true,
    bool isDismissible = true,
    bool useRootNavigator = true,
    bool isScrollControlled = false,
    bool isFullScreen = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: backgroundColor ?? context.colorTheme.bgSurfaceMain,
      elevation: elevation,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      useRootNavigator: useRootNavigator,
      isScrollControlled: isFullScreen || isScrollControlled,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: isFullScreen ? 0.85 : null,
          child: Container(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: AppSpacing.bottomPaddingValue(
                context,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }

  static Future<bool> showConfirmDialog(
    BuildContext context, {
    String? message,
    String? title,
    Widget? icon,
    String? positiveText,
    String? negativeText,
  }) async {
    var isConfirmed = false;

    await showAlertDialog(
      context,
      icon: _IllustrationConfirmModal(),
      // title: title ?? context.l10n.global__cancel_confirm_title,
      // message: message ?? context.l10n.global__cancel_confirm_message,
      // positiveText: positiveText ?? context.l10n.button__confirm,
      // positiveColor: context.colorTheme.bgStatusDelete,
      // positiveTextColor: context.colorTheme.txtInversePrimary,
      // negativeText: negativeText ?? context.l10n.button__cancel,
      title: title ?? '',
      message: message ?? '',
      positiveText: positiveText ?? '',
      positiveColor: context.colorTheme.bgStatusDelete,
      positiveTextColor: context.colorTheme.txtInversePrimary,
      negativeText: negativeText ?? '',
      onPositivePressed: () {
        isConfirmed = true;
        context.pop();
      },
    );

    return isConfirmed;
  }

  static void showErrorToast(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    getIt.get<AppOverlayBloc>().add(
          ShowOverlayEvent(
            message,
            alertType: AlertType.error,
            duration: duration,
          ),
        );
  }

  static void showSuccessToast(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    getIt.get<AppOverlayBloc>().add(
          ShowOverlayEvent(
            message,
            alertType: AlertType.success,
            duration: duration,
          ),
        );
  }
}

class _IllustrationConfirmModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: const Color(0xFFFEEFC6),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 8,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFFFF9EB),
              ),
              borderRadius: BorderRadius.circular(28.0),
            ),
          ),
          child: Assets.icons.alertTriangle.svg(
            colorFilter: ColorFilter.mode(
                context.colorTheme.icStatusWarning, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
