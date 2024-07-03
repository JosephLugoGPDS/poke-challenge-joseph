part of 'poke_list_cubit.dart';

class PokeListState extends Equatable {
  const PokeListState();

  @override
  List<Object> get props => [];
}

final class PokeListInitial extends PokeListState {
  const PokeListInitial();
}

final class PokeListLoading extends PokeListState {
  const PokeListLoading();
}

final class PokeListMoreLoading extends PokeListState {
  const PokeListMoreLoading();
}

final class PokeListLoaded extends PokeListState {
  const PokeListLoaded({
    required this.pokeList,
    required this.next,
    required this.count,
  });
  final List<PokemonModel> pokeList;
  final bool next;
  final int count;
}

final class PokeListError extends PokeListState {
  const PokeListError({required this.failure});
  final Failure failure;
}
