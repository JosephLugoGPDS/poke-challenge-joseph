import 'package:app/feature/poke_detail/presentation/bloc/poke_heart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:app/core/extension/string_extension.dart';
import 'package:app/feature/poke_list/data/model/pokemon_list_model.dart';
import 'package:app/feature/poke_list/presentation/view/poke_background.dart';
import 'package:app/feature/poke_detail/presentation/bloc/poke_detail_cubit.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    final pokeDetailCubit = context.read<PokeDetailCubit>();
    return BlocBuilder<PokeHeartCubit, List<String>>(
      builder: (context, state) {
        final isFavorited = state.contains(pokemon.name);
        return GestureDetector(
          onTap: () {
            pokeDetailCubit.doGetPokeDetail(pokemon.url!);
            context.go('/detail');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                const PokeBackground(),
                Positioned(
                  top: 12.w,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      if (isFavorited) {
                        context
                            .read<PokeHeartCubit>()
                            .removePokemon(pokemon.name!);
                      } else {
                        context
                            .read<PokeHeartCubit>()
                            .addPokemon(pokemon.name!);
                      }
                    },
                    child: SvgPicture.asset(
                      isFavorited
                          ? Assets.icons.heartFilled
                          : Assets.icons.heartOutline,
                      width: 20.w,
                      height: 20.w,
                    ),
                  ),
                ),
                Positioned(
                  top: 12.w,
                  left: 26.w,
                  right: 19.w,
                  child: Image.network(
                    pokemon.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 12.5.w,
                  left: 12.w,
                  right: 12.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pokemon.name!.capitalize(),
                        style: context.textTheme.labelLarge,
                      ),
                      SvgPicture.asset(
                        Assets.icons.next,
                        width: 20.w,
                        height: 20.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
