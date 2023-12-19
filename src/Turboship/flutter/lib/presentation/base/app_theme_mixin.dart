import 'package:flutter/material.dart';
import 'package:turboship/all.dart';

mixin AppThemeMixin<T extends StatefulWidget> on State<T> {
  AppColors get colorTheme => context.colorTheme;
  AppTextTheme get textTheme => context.textTheme;
}
