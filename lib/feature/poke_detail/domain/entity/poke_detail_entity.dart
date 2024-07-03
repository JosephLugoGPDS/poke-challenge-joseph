import 'package:app/feature/poke_detail/data/model/poke_detail_model.dart.dart';
import 'package:equatable/equatable.dart';

class PokemonDetailEntity extends Equatable {
  const PokemonDetailEntity({
    required this.types,
    required this.weight,
    required this.height,
    required this.stats,
    required this.moves,
    required this.name,
    required this.imageUrl,
  });
  final List<PokemonTypeModel> types;
  final int? weight;
  final int? height;
  final List<PokemonStatModel> stats;
  final List<PokemonMoveModel> moves;
  final String? name;
  final String? imageUrl;

  @override
  List<Object?> get props => [types, weight, height, stats, moves];
}

class PokemonType extends Equatable {
  const PokemonType({
    required this.slot,
    required this.name,
    required this.url,
  });
  final int? slot;
  final String? name;
  final String? url;

  @override
  List<Object?> get props => [slot, name, url];
}

class PokemonStat extends Equatable {
  const PokemonStat({
    required this.baseStat,
    required this.effort,
    required this.name,
    required this.url,
  });
  final int? baseStat;
  final int? effort;
  final String? name;
  final String? url;

  @override
  List<Object?> get props => [baseStat, effort, name, url];
}

class PokemonMove extends Equatable {
  const PokemonMove({
    required this.name,
    required this.url,
    required this.versionGroupDetails,
  });

  final String? name;
  final String? url;
  final List<VersionGroupDetailModel> versionGroupDetails;

  @override
  List<Object?> get props => [name, url, versionGroupDetails];
}

class VersionGroupDetail extends Equatable {
  const VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  final int? levelLearnedAt;
  final String? moveLearnMethod;
  final String? versionGroup;

  @override
  List<Object?> get props => [levelLearnedAt, moveLearnMethod, versionGroup];
}
