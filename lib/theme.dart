import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF735C00),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFE084),
  onPrimaryContainer: Color(0xFF231B00),
  secondary: Color(0xFF4D57A9),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDFE0FF),
  onSecondaryContainer: Color(0xFF000B63),
  tertiary: Color(0xFFB71F29),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDAD7),
  onTertiaryContainer: Color(0xFF410005),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  outline: Color(0xFF7D7667),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1E1B16),
  surface: Color(0xFFFFF8F0),
  onSurface: Color(0xFF1E1B16),
  surfaceVariant: Color(0xFFEBE2CF),
  onSurfaceVariant: Color(0xFF4C4639),
  inverseSurface: Color(0xFF33302A),
  onInverseSurface: Color(0xFFF7F0E7),
  inversePrimary: Color(0xFFE8C347),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF735C00),
  outlineVariant: Color(0xFFCEC6B4),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFE8C347),
  onPrimary: Color(0xFF3C2F00),
  primaryContainer: Color(0xFF574500),
  onPrimaryContainer: Color(0xFFFFE084),
  secondary: Color(0xFFBCC2FF),
  onSecondary: Color(0xFF1B2678),
  secondaryContainer: Color(0xFF343F90),
  onSecondaryContainer: Color(0xFFDFE0FF),
  tertiary: Color(0xFFFFB3AE),
  onTertiary: Color(0xFF68000C),
  tertiaryContainer: Color(0xFF930016),
  onTertiaryContainer: Color(0xFFFFDAD7),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  outline: Color(0xFF979080),
  background: Color(0xFF1E1B16),
  onBackground: Color(0xFFE8E2D9),
  surface: Color(0xFF15130E),
  onSurface: Color(0xFFCCC6BD),
  surfaceVariant: Color(0xFF4C4639),
  onSurfaceVariant: Color(0xFFCEC6B4),
  inverseSurface: Color(0xFFE8E2D9),
  onInverseSurface: Color(0xFF1E1B16),
  inversePrimary: Color(0xFF735C00),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFE8C347),
  outlineVariant: Color(0xFF4C4639),
  scrim: Color(0xFF000000),
);

InputDecorationTheme createInputDecTheme(BuildContext context) {
  final inputDecorationTheme = Theme.of(context).inputDecorationTheme;
  return inputDecorationTheme.copyWith(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
}
