import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/core/network/failure.dart';
import 'package:app/feature/poke_detail/data/model/poke_detail_model.dart.dart';
import 'package:app/feature/poke_detail/domain/use_case/get_poke_detail_use_case.dart';

part 'poke_detail_state.dart';

class PokeDetailCubit extends Cubit<PokeDetailState> {
  PokeDetailCubit({
    required GetPokeDetailUseCase getPokeDetailUseCase,
  })  : _getPokeDetailUseCase = getPokeDetailUseCase,
        super(const PokeDetailInitial());
  final GetPokeDetailUseCase _getPokeDetailUseCase;

  Future<void> doGetPokeDetail(String url) async {
    emit(const PokeDetailLoading());
    final result = await _getPokeDetailUseCase(url);
    result.fold(
      (failure) => emit(PokeDetailError(failure: failure)),
      (data) {
        emit(
          PokeDetailLoaded(pokemon: data as PokemonDetailModel),
        );
      },
    );
  }

  void clearPokeDetail() => emit(const PokeDetailInitial());
}
