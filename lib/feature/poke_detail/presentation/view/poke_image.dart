import 'package:flutter/material.dart';
import 'package:app/core/extension/size_extension.dart';

class PokeImage extends StatelessWidget {
  const PokeImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 396.w,
          height: 316.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.05),
                Color.fromRGBO(255, 255, 255, 0.2),
              ],
            ),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
