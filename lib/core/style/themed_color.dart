import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/rgb_color.dart';
import 'package:flutter/material.dart';

class ThemedColor {
  const ThemedColor({required this.color});

  factory ThemedColor.fromJson(dynamic json) {
    if (json is String) {
      return ThemedColor(color: RgbColor(json));
    }

    if (json is Map<String, dynamic>) {
      return ThemedColor.fromOldJsonFormat(json);
    }
    return ThemedColor.empty;
  }

  factory ThemedColor.fromOldJsonFormat(Map<String, dynamic> json) {
    final lightHex = json['light'] as String;
    return ThemedColor(color: RgbColor(lightHex));
  }

  factory ThemedColor.fromColor(Color color) {
    final rgbColor = color.rgbColor;
    return ThemedColor(color: rgbColor);
  }

  factory ThemedColor.fromCalendar({
    required int color,
  }) {
    // Convert the int color value to a hex string
    final hexColor = '#${color.toRadixString(16).padLeft(6, '0')}';

    return ThemedColor(
      color: RgbColor(hexColor),
    );
  }

  static const empty = ThemedColor(color: RgbColor.white);

  final RgbColor color;

  String toJson() => color.hex;
}

extension ThemedColorExtension on ThemedColor {
  Color getAdaptiveColor(BuildContext context) {
    return context.theme.brightness == Brightness.light
        ? color.toColor
        : _darken(color.toColor);
  }

  String getAdaptiveHex(BuildContext context) {
    return context.theme.brightness == Brightness.light ? color.hex : color.hex;
    // : _darken(color.toColor).hex;
  }

  Color _darken(Color color, [double amount = .2]) {
    final hsl = HSLColor.fromColor(color);
    final hslDarkened =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDarkened.toColor();
  }
}
