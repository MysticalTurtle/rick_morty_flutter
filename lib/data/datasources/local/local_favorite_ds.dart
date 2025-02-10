import 'package:rickandmorty/core/db/database_helper.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/data/model/favorite_model.dart';

abstract class LocalFavoriteDS {
  Future<List<FavoriteModel>> getFavoriteCharacters();
  Future<bool> addFavoriteCharacter(FavoriteModel favorite);
  Future<bool> removeFavoriteCharacter(int favoriteId);
}

class LocalFavoriteDSI implements LocalFavoriteDS {
  LocalFavoriteDSI({required this.db});

  final DatabaseHelper db;

  @override
  Future<List<FavoriteModel>> getFavoriteCharacters() async {
    try {
      final response = await DatabaseHelper.instance.readAllFavorites();
      final favorites = response.map(FavoriteModel.fromMap).toList();
      return favorites;
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw const Failure(message: 'Error desconocido');
    }
  }

  @override
  Future<bool> addFavoriteCharacter(FavoriteModel favorite) async {
    await DatabaseHelper.instance.create(favorite.toMap());
    return true;
  }

  @override
  Future<bool> removeFavoriteCharacter(int favoriteId) async {
    await DatabaseHelper.instance.delete(favoriteId);
    return true;
  }
}
