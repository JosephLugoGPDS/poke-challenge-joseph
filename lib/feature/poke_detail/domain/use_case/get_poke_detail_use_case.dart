import 'package:dartz/dartz.dart';
import 'package:app/core/util/use_case.dart';
import 'package:app/core/network/failure.dart';
import 'package:app/feature/poke_detail/domain/entity/poke_detail_entity.dart';
import 'package:app/feature/poke_detail/domain/repository/poke_detail_repository.dart';

class GetPokeDetailUseCase extends UseCase<PokemonDetailEntity, String> {
  GetPokeDetailUseCase({required this.repository});
  final PokeDetailRepository repository;
  @override
  Future<Either<Failure, PokemonDetailEntity>> call(String params) async =>
      await repository.getPokeDetail(params);
}
