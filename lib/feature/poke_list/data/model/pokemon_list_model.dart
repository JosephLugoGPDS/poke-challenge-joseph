// ignore_for_file: use_super_parameters

import 'package:app/core/mapper/pokemon_list_mapper.dart';
import 'package:app/core/network/environment.dart';
import 'package:app/feature/poke_list/domain/entity/pokemon_list.dart';

class PokemonListModel extends PokemonListEntity {
  const PokemonListModel({
    required int? count,
    required String? next,
    required String? previous,
    required List<PokemonModel> results,
  }) : super(count: count, next: next, previous: previous, results: results);

  static List<PokemonModel> fromJsonPokemonList(List<dynamic> jsonList) =>
      jsonList
          .map((dynamic item) =>
              PokemonModel.fromJson(item as Map<String, dynamic>))
          .toList();

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    return PokemonListModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: fromJsonPokemonList(json['results'] ?? []),
    ).toDomain();
  }
}

class PokemonModel extends Pokemon {
  const PokemonModel({
    required String? name,
    required String? url,
    required String? imageUrl,
  }) : super(name: name, url: url, imageUrl: imageUrl);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
            name: json['name'],
            url: json['url'],
            imageUrl: loadUrlImage(json['url']))
        .toDomain();
  }
}

String? loadUrlImage(String? url) {
  if (url == null) return null;
  final splitUrl = url.split("/");
  final pokemonNumber = splitUrl[splitUrl.length - 2];

  final imageUrl = "${Env.uriSprite}/$pokemonNumber.png";

  return imageUrl;
}
