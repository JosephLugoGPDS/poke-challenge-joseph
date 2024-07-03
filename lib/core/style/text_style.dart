import 'package:app/core/extension/size_extension.dart';
import 'package:app/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme getTextTheme(ColorScheme colorScheme) {
  const headlineColor = darkFontColor;
  const headlineWeight = FontWeight.w900;
  const headlineHeight = 1.2;
  const headlineLetterSpacing = 0.0;

  const titleColor = darkFontColor;
  const titleWeight = FontWeight.bold;
  const titleHeight = 1.2;
  const titleLetterSpacing = 0.0;

  const bodyColor = darkFontColor;
  const bodyWeight = FontWeight.w500;
  const bodyHeight = 1.5;
  const bodyLetterSpacing = 0.0;

  const labelColor = darkFontColor;

  final textTheme = TextTheme(
    // Headline
    headlineLarge: TextStyle(
      fontSize: 40.sp,
      height: headlineHeight,
      letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineMedium: TextStyle(
      fontSize: 26.sp,
      height: headlineHeight,
      letterSpacing: titleLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      height: headlineHeight,
      letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),

    // Title
    titleLarge: TextStyle(
      fontSize: 20.sp,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleMedium: TextStyle(
      fontSize: 18.sp,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 20.sp,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      height: bodyHeight,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),

    // Label
    labelLarge: TextStyle(
      fontSize: 16.sp,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: titleWeight,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: bodyWeight,
    ),
    labelSmall: TextStyle(
      fontSize: 12.sp,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: bodyWeight,
    ),
  );

  return GoogleFonts.poppinsTextTheme(textTheme);
}
