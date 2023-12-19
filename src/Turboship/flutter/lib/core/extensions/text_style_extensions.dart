import 'package:flutter/material.dart';
import 'package:turboship/all.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get regular => copyWith(fontWeight: FontWeight.normal);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle branchColor(BuildContext context) =>
      copyWith(color: context.colorTheme.txtNormalBrand);
  TextStyle errorColor(BuildContext context) =>
      copyWith(color: context.colorTheme.txtStatusDanger);
  TextStyle primaryTextColor(BuildContext context) =>
      copyWith(color: context.colorTheme.txtNormalPrimary);
  TextStyle secondaryTextColor(BuildContext context) =>
      copyWith(color: context.colorTheme.txtNormalSecondary);
  TextStyle tertiaryTextColor(BuildContext context) =>
      copyWith(color: context.colorTheme.txtNormalTertiary);

  TextStyle toColor(Color color) => copyWith(color: color);
}
