import 'package:app/core/network/failure.dart';
import 'package:app/feature/poke_list/data/model/pokemon_list_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/feature/poke_list/domain/use_case/get_poke_list_use_case.dart';

part 'poke_list_state.dart';

class PokeListCubit extends Cubit<PokeListState> {
  PokeListCubit({
    required GetPokeListUseCase getPokeListUseCase,
  })  : _getPokeListUseCase = getPokeListUseCase,
        super(const PokeListInitial());
  final GetPokeListUseCase _getPokeListUseCase;

  Future<void> doGetPokeList() async {
    offset == 0
        ? emit(const PokeListLoading())
        : emit(const PokeListMoreLoading());
    final result = await _getPokeListUseCase(offset.toString());
    result.fold(
      (failure) {
        offset = 0;
        hasMorePokemonsToLoad = true;
        emit(PokeListError(failure: failure));
      },
      (data) {
        hasMorePokemonsToLoad = data.next!.isNotEmpty;
        if (offset > 0) {
          pokeList.addAll(data.results);
        } else {
          pokeList = data.results;
        }
        offset += 20;
        emit(
          PokeListLoaded(
            pokeList: pokeList,
            next: hasMorePokemonsToLoad,
            count: data.count!,
          ),
        );
      },
    );
  }

  void clearPokeList() {
    pokeList = [];
    hasMorePokemonsToLoad = true;
    offset = 0;
    emit(const PokeListInitial());
  }

  bool hasMorePokemonsToLoad = true;
  List<PokemonModel> pokeList = [];
  int offset = 0;
}
