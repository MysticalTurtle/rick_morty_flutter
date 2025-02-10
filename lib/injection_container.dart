import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/core/db/database_helper.dart';
import 'package:rickandmorty/data/datasources/local/local_favorite_ds.dart';
import 'package:rickandmorty/data/datasources/remote/remote_character_ds.dart';
import 'package:rickandmorty/data/repositories/character_repository_i.dart';
import 'package:rickandmorty/data/repositories/favorites_repository_i.dart';
import 'package:rickandmorty/domain/repositories/character_repository.dart';
import 'package:rickandmorty/domain/repositories/favorites_repository.dart';
import 'package:rickandmorty/presentation/modules/characters/cubit/characters_cubit.dart';

final sl = GetIt.instance;

Future<void> init({required Dio dio}) async {
  // Bloc
  sl
    ..registerLazySingleton(
      () => CharactersCubit(
        repository: sl(),
      ),
    )

    // Repository
    ..registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryI(
        remoteDS: sl(),
      ),
    )
    ..registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryI(
        localDS: sl(),
      ),
    )

    // Data sources
    ..registerLazySingleton<LocalFavoriteDS>(
      () => LocalFavoriteDSI(db: DatabaseHelper.instance),
    )
    ..registerLazySingleton<RemoteCharacterDS>(
      () => RemoteCharacterDSI(dio: dio),
    );
}
