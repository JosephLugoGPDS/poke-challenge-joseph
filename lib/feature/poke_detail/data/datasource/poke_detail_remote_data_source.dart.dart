import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:app/core/network/network.dart';
import 'package:app/feature/poke_detail/data/model/poke_detail_model.dart.dart';

abstract class PokeDetailRemoteDataSource {
  Future<ResponseApp> getPokeDetail(String url);
}

class PokeDetailRemoteDataSourceImpl implements PokeDetailRemoteDataSource {
  const PokeDetailRemoteDataSourceImpl();

  @override
  Future<ResponseApp> getPokeDetail(String url) async {
    final dio = Dio();
    try {
      final response = await dio.get(url);
      final data = response.data;
      final pokemonResponse = PokemonDetailModel.fromJson(data);
      return Success<PokemonDetailModel>(pokemonResponse);
    } on DioException catch (e) {
      log(e.toString());
      return ErrorApp<Failure>(FailureMessage(msg: e.toString()));
    }
  }
}
