import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../resource/styles/all.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomCheckBox({
    required this.value,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: context.colorTheme.bgSurfaceInverseMain,
      checkColor: context.colorTheme.bgSurfaceMain,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.borderRadius4),
      side: BorderSide(color: context.colorTheme.bgSurfaceSf3),
      onChanged: _onChanged,
    );
  }

  void _onChanged(bool? value) {
    if (value != null) {
      onChanged?.call(value);
    }
  }
}
