import 'package:flutter/material.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:app/feature/poke_list/presentation/view/card_grid_loader.dart';

class PokeGridLoaderView extends StatelessWidget {
  const PokeGridLoaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 18.h,
        childAspectRatio: 188 / 177,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext _, int __) {
          return const CardGridLoader();
        },
        childCount: 8,
      ),
    );
  }
}
