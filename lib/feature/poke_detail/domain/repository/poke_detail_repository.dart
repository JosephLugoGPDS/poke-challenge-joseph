import 'package:dartz/dartz.dart';
import 'package:app/core/network/failure.dart';
import 'package:app/feature/poke_detail/domain/entity/poke_detail_entity.dart';

abstract class PokeDetailRepository {
  Future<Either<Failure, PokemonDetailEntity>> getPokeDetail(String url);
}
