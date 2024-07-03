import 'package:flutter/material.dart';
import 'package:app/core/util/utils.dart';

class PokeBackground extends StatelessWidget {
  const PokeBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> colorPair = Utils.getRandomColorPair();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorPair['primary']!,
            colorPair['secondary']!,
          ],
        ),
      ),
    );
  }
}
