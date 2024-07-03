part of 'poke_detail_cubit.dart';

class PokeDetailState extends Equatable {
  const PokeDetailState();
  @override
  List<Object> get props => [];
}

final class PokeDetailInitial extends PokeDetailState {
  const PokeDetailInitial();
  @override
  List<Object> get props => [];
}

final class PokeDetailLoading extends PokeDetailState {
  const PokeDetailLoading();
  @override
  List<Object> get props => [];
}

final class PokeDetailLoaded extends PokeDetailState {
  const PokeDetailLoaded({required this.pokemon});
  final PokemonDetailModel pokemon;
  @override
  List<Object> get props => [pokemon];
}

final class PokeDetailError extends PokeDetailState {
  const PokeDetailError({required this.failure});
  final Failure failure;
  @override
  List<Object> get props => [failure];
}
