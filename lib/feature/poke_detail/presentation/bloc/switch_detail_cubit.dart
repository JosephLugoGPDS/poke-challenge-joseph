import 'package:flutter_bloc/flutter_bloc.dart';

enum DetailIndex { stats, moves }

class SwitchDetailCubit extends Cubit<DetailIndex> {
  SwitchDetailCubit() : super(DetailIndex.stats);

  void switchToMoves() {
    emit(DetailIndex.moves);
  }

  void switchToStats() {
    emit(DetailIndex.stats);
  }
}
