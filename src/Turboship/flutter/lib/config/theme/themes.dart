import 'package:flutter/material.dart';

ThemeData darkBlue = createTheme(Brightness.dark, shape, 0xFF0000FF);
ThemeData darkGold = createTheme(Brightness.dark, shape, 0xFFFFD700);
ThemeData darkGreen = createTheme(Brightness.dark, shape, 0xFF00FF00);
ThemeData darkOrange = createTheme(Brightness.dark, shape, 0xFFFFA500);
ThemeData darkPink = createTheme(Brightness.dark, shape, 0xFFFFC0CB);
ThemeData darkPurple = createTheme(Brightness.dark, shape, 0xFF00FF);
ThemeData darkRed = createTheme(Brightness.dark, shape, 0xFFFF0000);

final darks = [
  darkBlue,
  darkGold,
  darkGreen,
  darkOrange,
  darkPink,
  darkPurple,
  darkRed,
  darkTheme,
];

ThemeData darkTheme = createTheme(Brightness.dark, shape, 0xFFD4AF37);

ThemeData lightBlue = createTheme(Brightness.light, shape, 0xFF0000FF);
ThemeData lightGold = createTheme(Brightness.light, shape, 0xFFFFD700);
ThemeData lightGreen = createTheme(Brightness.light, shape, 0xFF00FF00);
ThemeData lightOrange = createTheme(Brightness.light, shape, 0xFFFFA500);
ThemeData lightPink = createTheme(Brightness.light, shape, 0xFFFFC0CB);
ThemeData lightPurple = createTheme(Brightness.light, shape, 0xFF00FF);
ThemeData lightRed = createTheme(Brightness.light, shape, 0xFFFF0000);

final lights = [
  lightBlue,
  lightGold,
  lightGreen,
  lightOrange,
  lightPink,
  lightPurple,
  lightRed,
  lightTheme,
];

ThemeData lightTheme = createTheme(Brightness.light, shape, 0xFFD4AF37);
RoundedRectangleBorder shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

// final themeColors = [
//   'Blue',
//   'Green',
//   'Gold',
//   'Orange',
//   'Pink',
//   'Purple',
//   'Red',
// ];
// ThemeData darkTheme = createTheme(Brightness.dark, shape, 0xFFD4AF37);
// ThemeData lightTheme = createTheme(Brightness.light, shape, 0xFFD4AF37);

final themeMap = {
  'Blue': {
    'light': lightBlue,
    'dark': darkBlue,
  },
  'Red': {
    'light': lightRed,
    'dark': darkRed,
  },
  'Gold': {
    'light': lightGold,
    'dark': darkGold,
  },
  'Orange': {
    'light': lightOrange,
    'dark': darkOrange,
  },
  'Pink': {
    'light': lightPink,
    'dark': darkPink,
  },
  'Purple': {
    'light': lightPurple,
    'dark': darkPurple,
  },
  'Green': {
    'light': lightGreen,
    'dark': darkGreen,
  }
};

Color C(BuildContext context, Kolor key) {
  final cs = Theme.of(context).colorScheme;
  switch (key) {
    case Kolor.primary:
      return cs.primary;
    case Kolor.onPrimary:
      return cs.onPrimary;
    case Kolor.primaryContainer:
      return cs.primaryContainer;
    case Kolor.onPrimaryContainer:
      return cs.onPrimaryContainer;

    case Kolor.secondary:
      return cs.secondary;
    case Kolor.onSecondary:
      return cs.onSecondary;
    case Kolor.secondaryContainer:
      return cs.secondaryContainer;
    case Kolor.onSecondaryContainer:
      return cs.onSecondaryContainer;

    case Kolor.tertiary:
      return cs.tertiary;
    case Kolor.onTertiary:
      return cs.onTertiary;
    case Kolor.tertiaryContainer:
      return cs.tertiaryContainer;
    case Kolor.onTertiaryContainer:
      return cs.onTertiaryContainer;

    case Kolor.error:
      return cs.error;
    case Kolor.onError:
      return cs.onError;
    case Kolor.errorContainer:
      return cs.errorContainer;
    case Kolor.onErrorContainer:
      return cs.onErrorContainer;

    case Kolor.surface:
      return cs.surface;
    case Kolor.onSurface:
      return cs.onSurface;
    case Kolor.surfaceVariant:
      return cs.surfaceVariant;
    case Kolor.onSurfaceVariant:
      return cs.onSurfaceVariant;
    case Kolor.surfaceTint:
      return cs.surfaceTint;

    case Kolor.outline:
      return cs.outline;
    case Kolor.outlineVariant:
      return cs.outlineVariant;

    case Kolor.inverseSurface:
      return cs.inverseSurface;
    case Kolor.onInverseSurface:
      return cs.onInverseSurface;
    case Kolor.inversePrimary:
      return cs.inversePrimary;

    case Kolor.background:
      return cs.background;
    case Kolor.onBackground:
      return cs.onBackground;
    case Kolor.scrim:
      return cs.scrim;
    case Kolor.shadow:
      return cs.shadow;
    default:
      throw Exception('Invalid color key: $key');
  }
}

ThemeData createTheme(Brightness brightness, s, color) {
  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorSchemeSeed: Color(color),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: s,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: s,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: s,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: s,
      ),
    ),
  );
}

enum Kolor {
  primary,
  onPrimary,
  primaryContainer,
  onPrimaryContainer,

  secondary,
  onSecondary,
  secondaryContainer,
  onSecondaryContainer,

  tertiary,
  onTertiary,
  tertiaryContainer,
  onTertiaryContainer,

  error,
  onError,
  errorContainer,
  onErrorContainer,

  surface,
  onSurface,
  surfaceVariant,
  onSurfaceVariant,
  surfaceTint,

  outline,
  outlineVariant,

  inverseSurface,
  onInverseSurface,
  inversePrimary,

  background,
  onBackground,
  scrim,
  shadow,
}
