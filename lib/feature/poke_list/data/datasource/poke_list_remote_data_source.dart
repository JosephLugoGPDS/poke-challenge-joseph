import 'dart:developer';
import 'package:app/feature/poke_list/data/model/pokemon_list_model.dart';
import 'package:dio/dio.dart';
import 'package:app/core/network/network.dart';

abstract class PokeListRemoteDataSource {
  Future<ResponseApp> getPokeList(String offset);
}

class PokeListRemoteDataSourceImpl implements PokeListRemoteDataSource {
  const PokeListRemoteDataSourceImpl();

  @override
  Future<ResponseApp> getPokeList(String offset) async {
    final dio = Dio();
    final url = '${Env.uriBase}/pokemon?offset=$offset&limit=20';
    try {
      final response = await dio.get(url);
      final data = response.data;
      final pokemonResponse = PokemonListModel.fromJson(data);
      return Success<PokemonListModel>(pokemonResponse);
    } on DioException catch (e) {
      log(e.toString());
      return ErrorApp<Failure>(FailureMessage(msg: e.toString()));
    }
  }
}
