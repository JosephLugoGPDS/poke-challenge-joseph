import 'package:app/feature/poke_detail/presentation/view/poke_moves_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/size_extension.dart';
import 'package:app/feature/poke_detail/presentation/view/poke_common_stats.dart';
import 'package:app/feature/poke_detail/presentation/view/poke_image.dart';
import 'package:app/feature/poke_detail/presentation/view/poke_stats_view.dart';
import 'package:app/feature/poke_detail/presentation/bloc/poke_detail_cubit.dart';
import 'package:app/feature/poke_detail/presentation/view/header_poke_detail.dart';
import 'package:app/feature/poke_detail/presentation/bloc/switch_detail_cubit.dart';

class PokeDetailScreen extends StatelessWidget {
  const PokeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeStatusbar = MediaQuery.of(context).padding.top;
    final sizeBottomBar = MediaQuery.of(context).padding.bottom;
    final l10n = context.l10n;
    final scrollController = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PokeDetailCubit, PokeDetailState>(
          builder: (context, state) {
            if (state is PokeDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokeDetailLoaded) {
              return CustomScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                clipBehavior: Clip.none,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      height: 143.h - sizeStatusbar + sizeBottomBar,
                      padding: EdgeInsets.only(left: 17.w, right: 15.w),
                      child: Column(
                        children: [
                          const Spacer(flex: 26),
                          HeaderPokeDetail(
                            name: state.pokemon.name!,
                          ),
                          const Spacer(flex: 43),
                        ],
                      ),
                    ),
                  ),
                  PokeImage(imageUrl: state.pokemon.imageUrl!),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 121.h,
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Column(
                        children: [
                          const Spacer(flex: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PokeCommonStats(
                                value: '${state.pokemon.height! / 10} M',
                                statistic: l10n.height,
                              ),
                              CircleAvatar(
                                radius: 32.h,
                                backgroundImage:
                                    NetworkImage(state.pokemon.imageUrl!),
                              ),
                              PokeCommonStats(
                                value: '${state.pokemon.weight! / 10} KG',
                                statistic: l10n.weight,
                              ),
                            ],
                          ),
                          const Spacer(flex: 33),
                        ],
                      ),
                    ),
                  ),
                  const PokeStatsHeader(),
                  BlocBuilder<SwitchDetailCubit, DetailIndex>(
                    builder: (context, detailIndex) {
                      switch (detailIndex) {
                        case DetailIndex.stats:
                          return PokeStatsView(stats: state.pokemon.stats);
                        case DetailIndex.moves:
                          return PokeMovesView(moves: state.pokemon.moves);
                        default:
                          return const SizedBox
                              .shrink(); //TODO: Implement default
                      }
                    },
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}

class PokeStatsHeader extends StatefulWidget {
  const PokeStatsHeader({
    super.key,
  });

  @override
  State<PokeStatsHeader> createState() => _PokeStatsHeaderState();
}

class _PokeStatsHeaderState extends State<PokeStatsHeader>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<SwitchDetailCubit>().stream.listen((state) {
      _tabController.animateTo(state == DetailIndex.stats ? 0 : 1);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        context.read<SwitchDetailCubit>().switchToStats();
      } else if (_tabController.index == 1) {
        context.read<SwitchDetailCubit>().switchToMoves();
      }
    });
    return SliverToBoxAdapter(
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabBar(
              controller: _tabController,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              tabs: [
                Tab(
                  height: 28.h,
                  child: Text(
                    l10n.stats,
                    style: context.primaryTextTheme.titleLarge,
                  ),
                ),
                Tab(
                  height: 28.h,
                  child: Text(
                    l10n.moves,
                    style: context.primaryTextTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
