import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../../core/utils/all.dart';
import '../resource/all.dart';
import 'all.dart';

class MoneyInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<double>? onAmountChanged;
  final double? maxAmount;
  final String? labelText;
  final String? hintText;
  final bool autofocus;
  final String? Function(String?)? validator;
  final TextStyle? style;

  const MoneyInput({
    required this.controller,
    super.key,
    this.onAmountChanged,
    this.maxAmount,
    this.labelText,
    this.hintText,
    this.validator,
    this.autofocus = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = MoneyUtil.currencyFormatter;

    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: TextInputType.number,
      style: style,
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: AppIcon(
          icon: AppIcons.close,
          onTap: _clear,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxWidth: Sizes.s24,
        ),
        border: InputBorder.none,
      ),
      inputFormatters: [
        CurrencyTextInputFormatter(
          locale: currencyFormat.locale,
          symbol: currencyFormat.currencySymbol,
          enableNegative: false,
        ),
      ],
      onChanged: (value) {
        final amount = double.tryParse(MoneyUtil.cleanFormattedMoney(value));

        if (maxAmount != null && amount != null && amount > maxAmount!) {
          controller.text = MoneyUtil.format(maxAmount!);

          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }

        onAmountChanged?.call(amount ?? 0);
      },
      validator: validator,
    );
  }

  void _clear() {
    controller.clear();
    onAmountChanged?.call(0);
  }
}
