import 'package:flutter/material.dart';

// Primary colors
const Color primary = Color(0xFFFFFFFF);
const Color secondary = Color(0xFF626262);

// Dark theme colors
const Color darkThemeLabelColor = Color(0xFFFFFFFF);
const Color darkBackground = Color(0xFF000000);
const Color darkFontColor = Color(0xFFFFFFFF);
const Color darkFontColorLight = Color(0xFFB3B3B3);
const Color darkSurface = Color(0xFF0A1010);
const Color darkDivider = Color(0xFFFFFFFF);
const Color darkPrimaryContainer = Color(0xffE6E9F9);
const Color darkSecondaryContainer = Color(0xffF8F8F8);
const Color onDarkSecondaryContainer = Color(0xffAFB5DF);
const Color lightest = Color(0xFFFFFFFF);
// Error color
const Color red = Color(0xFFFF3B30);
const Color yellow = Color(0xFFEBC974);

// Dark color scheme
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primary,
  onPrimary: darkFontColor,
  primaryContainer: darkPrimaryContainer,
  onPrimaryContainer: secondary,
  secondary: secondary,
  onSecondary: secondary,
  secondaryContainer: darkSecondaryContainer,
  onSecondaryContainer: onDarkSecondaryContainer,
  error: red,
  onError: lightest,
  background: darkBackground,
  onBackground: darkFontColor,
  surface: darkSurface,
  onSurface: yellow,
  surfaceVariant: darkSurface,
  onSurfaceVariant: darkFontColorLight,
  outline: darkDivider,
);
