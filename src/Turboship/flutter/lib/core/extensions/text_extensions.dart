import 'package:flutter/material.dart';
import 'package:turboship/all.dart';

extension TextExt on Text {
  Text b12SmMedium(BuildContext context) {
    return _copyWith(style: context.textTheme.b12SmMedium);
  }

  Text b14BaseMedium(BuildContext context) {
    return _copyWith(style: context.textTheme.b14BaseMedium);
  }

  Text b14BaseRegular(BuildContext context) {
    return _copyWith(style: context.textTheme.b14BaseRegular);
  }

  Text heading2Medium(BuildContext context) {
    return _copyWith(style: context.textTheme.headingH24xlSemibold);
  }

  Text heading4Medium(BuildContext context) {
    return _copyWith(style: context.textTheme.headingH42xlSemibold);
  }

  Text _copyWith({
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    TextScaler? textScaler,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) {
    return Text(
      data!,
      style: style ?? this.style,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaler: textScaler ?? this.textScaler,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    );
  }
}
