import 'package:flutter/material.dart';

import '../../core/extensions/all.dart';
import '../resource/all.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.autofocus = false,
    this.autocorrect = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense = true,
    this.border,
    this.textCapitalization = TextCapitalization.none,
    this.label,
    this.readOnly = false,
    this.onTap,
    this.validator,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final bool autofocus;
  final bool autocorrect;
  final bool enabled;
  final int maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDense;
  final InputBorder? border;
  final TextCapitalization textCapitalization;
  final String? label;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final Widget child = TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(12.0, 10, 8, 10),
        fillColor: !enabled ? context.colorTheme.bgSurfaceDisabled : null,
        filled: !enabled,
        isDense: isDense,
        hintText: hintText,
        hintStyle: context.textTheme.b14BaseRegular.toColor(context.colorTheme.txtNormalTertiary),
        errorText: errorText,
        errorStyle: context.textTheme.b12SmMedium.toColor(context.colorTheme.txtStatusDanger),
        errorMaxLines: 2,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: Sizes.s12, right: Sizes.s8),
                child: prefixIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(maxWidth: Sizes.s20 + Sizes.s16),
        suffixIcon: Padding(
          padding: AppSpacing.edgeInsetsH8,
          child: suffixIcon,
        ),
        suffixIconConstraints: const BoxConstraints(maxWidth: Sizes.s20 + Sizes.s16),
        border: _defaultBorder(context),
        enabledBorder: _defaultBorder(context),
        disabledBorder: _defaultBorder(context),
        focusedBorder: _defaultBorder(context, focused: true),
        errorBorder: _defaultBorder(context, error: true),
      ),
      style: context.textTheme.b14BaseRegular.copyWith(
        color: context.colorTheme.txtNormalSecondary,
        height: 1.3,
      ),
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      autofocus: autofocus,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      onTap: onTap,
    );

    if (label == null) {
      return child;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: context.textTheme.b14BaseMedium.toColor(context.colorTheme.txtNormalSecondary),
        ),
        AppSpacing.gapH4,
        child,
      ],
    );
  }

  InputBorder? _defaultBorder(
    BuildContext context, {
    bool focused = false,
    bool error = false,
  }) {
    Color borderColor = context.colorTheme.bdSurfaceMain;
    if (!enabled) {
      borderColor = Colors.transparent;
    } else if (focused && !readOnly) {
      borderColor = context.colorTheme.bdDecorBrandBase;
    } else if (error) {
      borderColor = context.colorTheme.bdStatusDanger;
    }

    return OutlineInputBorder(
      borderRadius: AppRadius.borderRadius6,
      borderSide: BorderSide(color: borderColor),
    );
  }
}
