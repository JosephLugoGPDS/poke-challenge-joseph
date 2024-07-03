import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:app/core/ui/widgets/search_field.dart';
import 'package:app/feature/poke_list/presentation/bloc/poke_list_cubit.dart';
import 'package:app/feature/poke_list/presentation/view/header_poke_list.dart';
import 'package:app/feature/poke_list/presentation/view/poke_card.dart';
import 'package:app/feature/poke_list/presentation/view/poke_grid_loader_view.dart';

class PokeListScreen extends StatefulWidget {
  const PokeListScreen({super.key});

  @override
  State<PokeListScreen> createState() => _PokeListScreenState();
}

class _PokeListScreenState extends State<PokeListScreen> {
  final ScrollController _scrollController = ScrollController();

  void _getMorePokemons() async {
    if (context.read<PokeListCubit>().hasMorePokemonsToLoad) {
      context.read<PokeListCubit>().doGetPokeList();
    }
  }

  void _scrollListener() {
    if (mounted) {
      final shouldLoadMoreData = _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent;

      if (shouldLoadMoreData) {
        _getMorePokemons();
      }
    }
  }

  @override
  void initState() {
    if (mounted) {
      _scrollController.addListener(_scrollListener);
      context.read<PokeListCubit>().doGetPokeList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final sizeStatusbar = MediaQuery.of(context).padding.top;
    final sizeBottomBar = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 271.h - sizeStatusbar + sizeBottomBar,
            child: Assets.images.backgroundBlur.image(),
          ),
          Positioned(
            top: 500.h - sizeStatusbar + sizeBottomBar,
            right: -92.w,
            child: Assets.images.backgroundCornerBlur.image(),
          ),
          SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              clipBehavior: Clip.none,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    height: 264.h - sizeStatusbar + sizeBottomBar,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        const HeaderPokeList(),
                        const Spacer(flex: 5),
                        Text(
                          l10n.findYourPokemon,
                          style: context.textTheme.headlineLarge,
                        ),
                        const Spacer(flex: 6),
                        SearchField(
                          l10n.search,
                          searchController: TextEditingController(),
                          searchTap: () {},
                          cleanTap: () {},
                          onTap: () {},
                        ),
                        const Spacer(flex: 8),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  sliver: BlocBuilder<PokeListCubit, PokeListState>(
                    builder: (context, state) {
                      if (state is PokeListLoaded ||
                          state is PokeListMoreLoading) {
                        final pokeList = context.read<PokeListCubit>().pokeList;
                        return SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h,
                            childAspectRatio: 188 / 177,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) => PokeCard(
                              pokemon: pokeList[index],
                            ),
                            childCount: pokeList.length,
                          ),
                        );
                      } else if (state is PokeListLoading) {
                        return const PokeGridLoaderView();
                      } else {
                        // TODO: Add error state
                        return const SliverFillRemaining(
                          child: Center(
                              child: Text('No se encontraron resultados')),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
