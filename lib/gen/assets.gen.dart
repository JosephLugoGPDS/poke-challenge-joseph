/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Poppins-Black.ttf
  String get poppinsBlack => 'assets/fonts/Poppins-Black.ttf';

  /// File path: assets/fonts/Poppins-Bold.ttf
  String get poppinsBold => 'assets/fonts/Poppins-Bold.ttf';

  /// File path: assets/fonts/Poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/Poppins-Light.ttf';

  /// File path: assets/fonts/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/Poppins-Medium.ttf';

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// File path: assets/fonts/Poppins-Thin.ttf
  String get poppinsThin => 'assets/fonts/Poppins-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        poppinsBlack,
        poppinsBold,
        poppinsLight,
        poppinsMedium,
        poppinsRegular,
        poppinsThin
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/drawer.svg
  String get drawer => 'assets/icons/drawer.svg';

  /// File path: assets/icons/heart_filled.svg
  String get heartFilled => 'assets/icons/heart_filled.svg';

  /// File path: assets/icons/heart_outline.svg
  String get heartOutline => 'assets/icons/heart_outline.svg';

  /// File path: assets/icons/left.svg
  String get left => 'assets/icons/left.svg';

  /// File path: assets/icons/next.svg
  String get next => 'assets/icons/next.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// List of all assets
  List<String> get values =>
      [drawer, heartFilled, heartOutline, left, next, search];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/background_blur.png
  AssetGenImage get backgroundBlur =>
      const AssetGenImage('assets/images/background_blur.png');

  /// File path: assets/images/background_corner_blur.png
  AssetGenImage get backgroundCornerBlur =>
      const AssetGenImage('assets/images/background_corner_blur.png');

  /// File path: assets/images/background_stats.png
  AssetGenImage get backgroundStats =>
      const AssetGenImage('assets/images/background_stats.png');

  /// File path: assets/images/type.png
  AssetGenImage get type => const AssetGenImage('assets/images/type.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [avatar, backgroundBlur, backgroundCornerBlur, backgroundStats, type];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
