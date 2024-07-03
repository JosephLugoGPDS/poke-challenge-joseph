import 'package:app/core/mapper/mapper.dart';
import 'package:app/core/extension/mapper_extension.dart';
import 'package:app/feature/poke_list/data/model/pokemon_list_model.dart';

extension PokemonListModelMapper on PokemonListModel? {
  PokemonListModel toDomain() {
    return PokemonListModel(
      count: this?.count.orZero() ?? Mapper.zero,
      next: this?.next.orEmpty() ?? Mapper.empty,
      previous: this?.previous.orEmpty() ?? Mapper.empty,
      results: this?.results.map((e) => e.toDomain()).toList() ??
          Mapper.listObjectEmpty(),
    );
  }
}

extension PokemonMapper on PokemonModel? {
  PokemonModel toDomain() {
    return PokemonModel(
      name: this?.name.orEmpty() ?? Mapper.empty,
      url: this?.url.orEmpty() ?? Mapper.empty,
      imageUrl: this?.imageUrl.orEmpty() ?? Mapper.empty,
    );
  }
}
