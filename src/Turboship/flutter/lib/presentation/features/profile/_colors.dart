import 'package:flutter/material.dart';
import 'package:turboship/all.dart';

final colors = [
  [Kolor.primary, Kolor.onPrimary],
  [Kolor.secondary, Kolor.onSecondary],
  [Kolor.tertiary, Kolor.onTertiary],
  [Kolor.error, Kolor.onError],
  [Kolor.surface, Kolor.onSurface],
  [Kolor.outline, Kolor.outlineVariant],
  [Kolor.inverseSurface, Kolor.onInverseSurface],
  [Kolor.onBackground, Kolor.background],
];

class TextColors extends StatelessWidget {
  const TextColors({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.l10n.text;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: colors.length,
      itemBuilder: (context, idx) {
        final color = colors[idx];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$text: ${color[0].name}',
              style: context.textTheme.b16LgRegular.toColor(
                C(context, color[0]),
              ),
            ),
            Container(
              color: C(context, color[0]),
              child: Row(
                children: [
                  Text(
                    '$text: ${color[1].name}',
                    style: context.textTheme.b16LgRegular.toColor(
                      C(context, color[1]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
