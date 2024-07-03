import 'package:dartz/dartz.dart';
import 'package:app/core/util/use_case.dart';
import 'package:app/core/network/failure.dart';
import 'package:app/feature/poke_list/domain/entity/pokemon_list.dart';
import 'package:app/feature/poke_list/domain/repository/poke_list_repository.dart';

class GetPokeListUseCase extends UseCase<PokemonListEntity, String> {
  GetPokeListUseCase({required this.repository});
  final PokeListRepository repository;
  @override
  Future<Either<Failure, PokemonListEntity>> call(String params) async =>
      await repository.getPokeList(params);
}
