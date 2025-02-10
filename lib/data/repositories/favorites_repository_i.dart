import 'dart:convert';

import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/data/datasources/local/local_favorite_ds.dart';
import 'package:rickandmorty/data/model/favorite_model.dart';
import 'package:rickandmorty/domain/entities/favorite.dart';
import 'package:rickandmorty/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryI extends FavoritesRepository {
  FavoritesRepositoryI({
    required this.localDS,
  });

  final LocalFavoriteDS localDS;

  @override
  Future<(Failure?, List<Favorite>?)> getFavorites() async {
    try {
      final favoritesModel = await localDS.getFavoriteCharacters();
      final jsonList = favoritesModel.map((e) => e.toMap()).toList();
      final charactersEntities = jsonList.map(Favorite.fromMap).toList();
      return (null, charactersEntities);
    } on Failure {
      rethrow;
    } on FormatException {
      return (const Failure(message: 'Formato incorrecto'), null);
    } catch (e) {
      if (e is Failure) {
        return (e, null);
      }
      return (const Failure(message: 'Error desconocido'), null);
    }
  }

  @override
  Future<(Failure?, bool?)> addFavorite(Favorite favorite) async {
    try {
      final favoriteModel = FavoriteModel(
        id: favorite.id,
        json: jsonEncode(favorite.toMap()),
        dateTime: DateTime.now().toIso8601String(),
      );
      await localDS.addFavoriteCharacter(favoriteModel);
      return (null, true);
    } on Failure {
      rethrow;
    } on FormatException {
      return (const Failure(message: 'Formato incorrecto'), null);
    } catch (e) {
      if (e is Failure) {
        return (e, null);
      }
      return (const Failure(message: 'Error desconocido'), null);
    }
  }

  @override
  Future<(Failure?, bool?)> removeFavorite(int favoriteId) async{
    try {
      await localDS.removeFavoriteCharacter(favoriteId);
      return (null, true);
    } on Failure {
      rethrow;
    } on FormatException {
      return (const Failure(message: 'Formato incorrecto'), null);
    } catch (e) {
      if (e is Failure) {
        return (e, null);
      }
      return (const Failure(message: 'Error desconocido'), null);
    }
  }
}
