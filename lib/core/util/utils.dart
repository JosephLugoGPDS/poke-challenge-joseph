import 'dart:math';
import 'dart:ui';

abstract class Utils {
  static Map<String, Color> getRandomColorPair() {
    final List<Map<String, Color>> colorPairs = [
      {
        'primary': const Color(0xFF9CDDF2),
        'secondary': const Color(0xFF5A808C)
      },
      {
        'primary': const Color(0xFFEDC045),
        'secondary': const Color(0xFF9B7E2D)
      },
      {
        'primary': const Color(0xFFEDBFD2),
        'secondary': const Color(0xFFA58593)
      },
      {
        'primary': const Color(0xFF72BE4C),
        'secondary': const Color(0xFF406B2B)
      },
      {
        'primary': const Color(0xFFED7622),
        'secondary': const Color(0xFFAA5518)
      },
      {
        'primary': const Color(0xFF6C5591),
        'secondary': const Color(0xFF302D36)
      },
      {
        'primary': const Color(0xFFC28552),
        'secondary': const Color(0xFF755031)
      },
      {
        'primary': const Color(0xFF71BB4B),
        'secondary': const Color(0xFF4A7C32)
      },
    ];

    final randomIndex = Random().nextInt(colorPairs.length);
    return colorPairs[randomIndex];
  }
}
