import 'package:equatable/equatable.dart';
import 'package:app/feature/poke_list/data/model/pokemon_list_model.dart';

abstract class PokemonListEntity extends Equatable {
  const PokemonListEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonModel> results;

  @override
  List<Object?> get props => [count, next, previous, results];
}

class Pokemon extends Equatable {
  final String? name;
  final String? url;
  final String? imageUrl;

  const Pokemon({
    required this.name,
    required this.url,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, url, imageUrl];
}
