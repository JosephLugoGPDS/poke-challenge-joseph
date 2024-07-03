import 'package:flutter_bloc/flutter_bloc.dart';

class PokeHeartCubit extends Cubit<List<String>> {
  PokeHeartCubit() : super(<String>[]);

  void addPokemon(String name) {
    if (!state.contains(name)) {
      emit(List.from(state)..add(name));
    }
  }

  void removePokemon(String name) {
    if (state.contains(name)) {
      emit(List.from(state)..remove(name));
    }
  }
}
