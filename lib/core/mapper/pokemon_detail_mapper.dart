import 'package:app/core/mapper/mapper.dart';
import 'package:app/core/extension/mapper_extension.dart';
import 'package:app/feature/poke_detail/data/model/poke_detail_model.dart.dart';

extension PokemonDetailModelMapper on PokemonDetailModel? {
  PokemonDetailModel toDomain() {
    return PokemonDetailModel(
      types: this?.types.map((e) => e.toDomain()).toList() ??
          Mapper.listObjectEmpty(),
      weight: this?.weight.orZero() ?? Mapper.zero,
      height: this?.height.orZero() ?? Mapper.zero,
      stats: this?.stats.map((e) => e.toDomain()).toList() ??
          Mapper.listObjectEmpty(),
      moves: this?.moves.map((e) => e.toDomain()).toList() ??
          Mapper.listObjectEmpty(),
      name: this?.name.orEmpty() ?? Mapper.empty,
      imageUrl: this?.imageUrl.orEmpty() ?? Mapper.empty,
    );
  }
}

extension PokemonTypeModelMapper on PokemonTypeModel? {
  PokemonTypeModel toDomain() {
    return PokemonTypeModel(
      slot: this?.slot.orZero() ?? Mapper.zero,
      name: this?.name.orEmpty() ?? Mapper.empty,
      url: this?.url.orEmpty() ?? Mapper.empty,
    );
  }
}

extension PokemonStatModelMapper on PokemonStatModel? {
  PokemonStatModel toDomain() {
    return PokemonStatModel(
      baseStat: this?.baseStat.orZero() ?? Mapper.zero,
      effort: this?.effort.orZero() ?? Mapper.zero,
      name: this?.name.orEmpty() ?? Mapper.empty,
      url: this?.url.orEmpty() ?? Mapper.empty,
    );
  }
}

extension PokemonMoveModelMapper on PokemonMoveModel? {
  PokemonMoveModel toDomain() {
    return PokemonMoveModel(
      name: this?.name.orEmpty() ?? Mapper.empty,
      url: this?.url.orEmpty() ?? Mapper.empty,
      versionGroupDetails:
          this?.versionGroupDetails.map((e) => e.toDomain()).toList() ??
              Mapper.listObjectEmpty(),
    );
  }
}

extension VersionGroupDetailModelMapper on VersionGroupDetailModel? {
  VersionGroupDetailModel toDomain() {
    return VersionGroupDetailModel(
      levelLearnedAt: this?.levelLearnedAt.orZero() ?? Mapper.zero,
      moveLearnMethod: this?.moveLearnMethod.orEmpty() ?? Mapper.empty,
      versionGroup: this?.versionGroup.orEmpty() ?? Mapper.empty,
    );
  }
}
