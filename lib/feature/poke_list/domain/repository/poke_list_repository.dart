import 'package:app/core/network/failure.dart';
import 'package:app/feature/poke_list/domain/entity/pokemon_list.dart';
import 'package:dartz/dartz.dart';

abstract class PokeListRepository {
  Future<Either<Failure, PokemonListEntity>> getPokeList(String offset);
}
