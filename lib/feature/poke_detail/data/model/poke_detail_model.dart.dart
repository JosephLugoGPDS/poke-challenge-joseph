// ignore_for_file: use_super_parameters
import 'package:app/core/mapper/pokemon_detail_mapper.dart';
import 'package:app/feature/poke_detail/domain/entity/poke_detail_entity.dart';

class PokemonDetailModel extends PokemonDetailEntity {
  const PokemonDetailModel({
    required List<PokemonTypeModel> types,
    required int? weight,
    required int? height,
    required List<PokemonStatModel> stats,
    required List<PokemonMoveModel> moves,
    required String? name,
    required String? imageUrl,
  }) : super(
          types: types,
          weight: weight,
          height: height,
          stats: stats,
          moves: moves,
          name: name,
          imageUrl: imageUrl,
        );

  static List<PokemonTypeModel> fromJsonPokemonTypeList(
          List<dynamic> jsonList) =>
      jsonList
          .map((dynamic item) =>
              PokemonTypeModel.fromJson(item as Map<String, dynamic>))
          .toList();

  static List<PokemonStatModel> fromJsonPokemonStatList(
          List<dynamic> jsonList) =>
      jsonList
          .map((dynamic item) =>
              PokemonStatModel.fromJson(item as Map<String, dynamic>))
          .toList();

  static List<PokemonMoveModel> fromJsonPokemonMoveList(
          List<dynamic> jsonList) =>
      jsonList
          .map((dynamic item) =>
              PokemonMoveModel.fromJson(item as Map<String, dynamic>))
          .toList();

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      types: fromJsonPokemonTypeList(json['types'] ?? []),
      weight: json['weight'],
      height: json['height'],
      stats: fromJsonPokemonStatList(json['stats'] ?? []),
      moves: fromJsonPokemonMoveList(json['moves'] ?? []),
      name: json['name'],
      imageUrl: json['sprites']?['front_default'],
    ).toDomain();
  }
}

class PokemonTypeModel extends PokemonType {
  const PokemonTypeModel({
    required int? slot,
    required String? name,
    required String? url,
  }) : super(slot: slot, name: name, url: url);

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      slot: json['slot'],
      name: json['name'],
      url: json['url'],
    ).toDomain();
  }
}

class PokemonStatModel extends PokemonStat {
  const PokemonStatModel({
    required int? baseStat,
    required int? effort,
    required String? name,
    required String? url,
  }) : super(baseStat: baseStat, effort: effort, name: name, url: url);

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatModel(
      baseStat: json['base_stat'],
      effort: json['effort'],
      name: json['stat']['name'],
      url: json['stat']['url'],
    ).toDomain();
  }
}

class PokemonMoveModel extends PokemonMove {
  const PokemonMoveModel({
    required String? name,
    required String? url,
    required List<VersionGroupDetailModel> versionGroupDetails,
  }) : super(name: name, url: url, versionGroupDetails: versionGroupDetails);

  static List<VersionGroupDetailModel> fromJsonVersionGroupDetailList(
          List<dynamic> jsonList) =>
      jsonList
          .map((dynamic item) =>
              VersionGroupDetailModel.fromJson(item as Map<String, dynamic>))
          .toList();

  factory PokemonMoveModel.fromJson(Map<String, dynamic> json) {
    return PokemonMoveModel(
      name: json['move']['name'],
      url: json['move']['url'],
      versionGroupDetails:
          fromJsonVersionGroupDetailList(json['version_group_details'] ?? []),
    ).toDomain();
  }
}

class VersionGroupDetailModel extends VersionGroupDetail {
  const VersionGroupDetailModel({
    required int? levelLearnedAt,
    required String? moveLearnMethod,
    required String? versionGroup,
  }) : super(
            levelLearnedAt: levelLearnedAt,
            moveLearnMethod: moveLearnMethod,
            versionGroup: versionGroup);

  factory VersionGroupDetailModel.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetailModel(
      levelLearnedAt: json['level_learned_at'],
      moveLearnMethod: json['move_learn_method']['name'],
      versionGroup: json['version_group']['name'],
    ).toDomain();
  }
}
