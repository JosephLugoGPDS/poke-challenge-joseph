import 'package:dartz/dartz.dart';
import 'package:app/core/network/failure.dart';
import 'package:app/core/network/response_app.dart';
import 'package:app/feature/poke_list/data/model/pokemon_list_model.dart';
import 'package:app/feature/poke_list/domain/repository/poke_list_repository.dart';
import 'package:app/feature/poke_list/data/datasource/poke_list_remote_data_source.dart';

class PokeListRepositoryImpl extends PokeListRepository {
  PokeListRepositoryImpl({
    required this.remoteDataSource,
  });
  final PokeListRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PokemonListModel>> getPokeList(String offset) async {
    try {
      final response = await remoteDataSource.getPokeList(offset);
      if (response is ErrorApp) {
        return Left(response.failure);
      }
      if (response is Success) {
        return Right(response.data);
      }
      return Left(ServerFailure());
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
