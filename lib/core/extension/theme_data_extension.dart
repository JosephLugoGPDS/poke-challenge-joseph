import 'dart:io';

import 'package:app/core/style/colors.dart';
import 'package:app/core/style/text_style.dart';
import 'package:flutter/material.dart';

extension ThemeDataExtension on ThemeData {
  static ThemeData get lightTheme => _getTheme(brightness: Brightness.light);

  static ThemeData get darkTheme => _getTheme(brightness: Brightness.dark);

  static ThemeData _getTheme({required Brightness brightness}) {
    final isAndroid = Platform.isAndroid;

    final colorScheme = switch (brightness) {
      Brightness.light => darkColorScheme,
      Brightness.dark => darkColorScheme,
    };
    final textTheme = getTextTheme(colorScheme);
    final primaryTextTheme = textTheme.apply(
      displayColor: colorScheme.onPrimary,
      bodyColor: colorScheme.onPrimary,
    );

    const iconTheme = IconThemeData(
      color: primary,
      size: null,
    );

    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    );
    const buttonPadding = EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    );
    final buttonTextStyle = textTheme.titleMedium;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      scaffoldBackgroundColor: colorScheme.background,
      disabledColor: darkSecondaryContainer,
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        space: 1,
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        labelStyle: textTheme.titleSmall,
        backgroundColor: colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        iconTheme: IconThemeData(
          color: colorScheme.onBackground,
          size: 18,
        ),
        side: const BorderSide(
          width: 1,
          color: secondary,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide.none,
        ),
        color: colorScheme.surfaceVariant,
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
      ),
      popupMenuTheme: PopupMenuThemeData(
        surfaceTintColor: colorScheme.background,
        shadowColor: isAndroid ? primary.withOpacity(0.3) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      toggleButtonsTheme: const ToggleButtonsThemeData(
        constraints: BoxConstraints(
          minHeight: 16,
          minWidth: 16,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        showDragHandle: false,
        backgroundColor: colorScheme.surfaceVariant,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.surfaceVariant,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: switch (brightness) {
          Brightness.light => darkFontColor,
          Brightness.dark => darkFontColor,
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        selectedIconTheme: iconTheme,
        unselectedIconTheme: iconTheme,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: textTheme.titleLarge,
        backgroundColor: colorScheme.background,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface,
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: darkBackground,
        contentTextStyle: primaryTextTheme.bodyLarge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.fromLTRB(16, 0, 8, 0),
      ),
      iconTheme: iconTheme,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: switch (brightness) {
          Brightness.light => Colors.white,
          Brightness.dark => primary,
        },
        filled: true,
        floatingLabelBehavior: isAndroid
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        hintStyle: textTheme.bodyLarge,
        labelStyle: textTheme.bodyLarge!.copyWith(
          color: switch (brightness) {
            Brightness.light => Colors.black38,
            Brightness.dark => null,
          },
          fontWeight: FontWeight.normal,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        foregroundColor: Colors.white,
        iconSize: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: buttonShape,
          padding: buttonPadding,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: buttonTextStyle,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: buttonShape,
          padding: buttonPadding,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1,
          ),
          foregroundColor: colorScheme.primary,
          textStyle: buttonTextStyle,
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: buttonShape,
          padding: buttonPadding,
          foregroundColor: colorScheme.primary,
          textStyle: buttonTextStyle,
        ),
      ),
    );
  }
}
