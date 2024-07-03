import 'package:app/feature/poke_detail/presentation/bloc/poke_detail_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:app/feature/poke_list/data/data.dart';
import 'package:app/feature/poke_list/domain/domain.dart';
import 'package:app/feature/poke_detail/data/data.dart';
import 'package:app/feature/poke_detail/domain/domain.dart';
import 'package:app/feature/poke_list/presentation/bloc/poke_list_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Feature - PokeList
  sl.registerLazySingleton<PokeListRepository>(
      () => PokeListRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<PokeListRemoteDataSource>(
      () => const PokeListRemoteDataSourceImpl());
  sl.registerLazySingleton<GetPokeListUseCase>(
      () => GetPokeListUseCase(repository: sl()));
  sl.registerFactory<PokeListCubit>(
      () => PokeListCubit(getPokeListUseCase: sl()));
  // Feature - PokeDetail
  sl.registerLazySingleton<PokeDetailRepository>(
      () => PokeDetailRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<PokeDetailRemoteDataSource>(
      () => const PokeDetailRemoteDataSourceImpl());
  sl.registerLazySingleton<GetPokeDetailUseCase>(
      () => GetPokeDetailUseCase(repository: sl()));
  sl.registerFactory<PokeDetailCubit>(
      () => PokeDetailCubit(getPokeDetailUseCase: sl()));
}
