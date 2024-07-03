import 'package:app/core/extension/context.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:app/core/extension/string_extension.dart';
import 'package:app/feature/poke_detail/data/model/poke_detail_model.dart.dart';
import 'package:flutter/widgets.dart';

class PokeStatsView extends StatelessWidget {
  const PokeStatsView({
    super.key,
    required this.stats,
  });
  final List<PokemonStatModel> stats;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
                stats.length,
                (index) => Table(
                      columnWidths: {
                        0: const FlexColumnWidth(),
                        1: const FlexColumnWidth(),
                        2: FixedColumnWidth(208.w),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text(
                              stats[index].name!.capitalize(),
                              style: context.primaryTextTheme.bodyMedium,
                            ),
                            Text(
                              stats[index].baseStat.toString(),
                              style:
                                  context.primaryTextTheme.bodyMedium!.copyWith(
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                              width: 208.w,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: context.colorScheme.primary
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: stats[index].baseStat! / 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: context.colorScheme.onSurface,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}
