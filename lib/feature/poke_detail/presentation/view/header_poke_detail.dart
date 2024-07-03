import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/string_extension.dart';
import 'package:app/feature/poke_detail/presentation/bloc/poke_heart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:go_router/go_router.dart';

class HeaderPokeDetail extends StatelessWidget {
  const HeaderPokeDetail({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.go('/'),
          child: SvgPicture.asset(
            Assets.icons.left,
            width: 36.w,
            height: 36.w,
          ),
        ),
        Text(
          name.capitalize(),
          style: context.textTheme.headlineLarge,
        ),
        BlocBuilder<PokeHeartCubit, List<String>>(
          builder: (context, state) {
            final isFavorited = state.contains(name);
            return GestureDetector(
              onTap: () {
                final cubit = context.read<PokeHeartCubit>();
                if (isFavorited) {
                  cubit.removePokemon(name);
                } else {
                  cubit.addPokemon(name);
                }
              },
              child: SvgPicture.asset(
                isFavorited
                    ? Assets.icons.heartFilled
                    : Assets.icons.heartOutline,
                width: 36.w,
                height: 36.w,
              ),
            );
          },
        ),
      ],
    );
  }
}
