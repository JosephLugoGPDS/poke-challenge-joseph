import 'package:dartz/dartz.dart';
import 'package:app/core/network/failure.dart';
import 'package:app/core/network/response_app.dart';
import 'package:app/feature/poke_detail/data/datasource/poke_detail_remote_data_source.dart.dart';
import 'package:app/feature/poke_detail/data/model/poke_detail_model.dart.dart';
import 'package:app/feature/poke_detail/domain/repository/poke_detail_repository.dart';

class PokeDetailRepositoryImpl extends PokeDetailRepository {
  PokeDetailRepositoryImpl({
    required this.remoteDataSource,
  });
  final PokeDetailRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PokemonDetailModel>> getPokeDetail(String url) async {
    try {
      final response = await remoteDataSource.getPokeDetail(url);
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
