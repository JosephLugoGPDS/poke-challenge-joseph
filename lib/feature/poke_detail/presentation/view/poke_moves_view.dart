import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/string_extension.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:app/feature/poke_detail/data/model/poke_detail_model.dart.dart';

class PokeMovesView extends StatelessWidget {
  const PokeMovesView({
    super.key,
    required this.moves,
  });
  final List<PokemonMoveModel> moves;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 396.w,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Assets.images.backgroundStats.path),
            ),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 16.w,
            children: List.generate(
              moves.length,
              (index) => FilledButton.tonal(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      context.colorScheme.primary.withOpacity(0.3)),
                ),
                onPressed: () {
                  //TODO: Implement onPressed
                },
                child: Text(
                  moves[index].name!.toTitleCase(),
                  style: context.primaryTextTheme.bodyMedium!
                      .copyWith(color: context.colorScheme.primary),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
