import 'package:dio/dio.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/data/model/character_model.dart';

abstract class RemoteCharacterDS {
  Future<List<CharacterModel>> getCharacterPage(int page);
  Future<CharacterModel> getSingleCharacter(int id);
  Future<List<CharacterModel>> searchByName(String name);
}

class RemoteCharacterDSI extends RemoteCharacterDS {
  RemoteCharacterDSI({required this.dio});

  final Dio dio;

  @override
  Future<List<CharacterModel>> getCharacterPage(int page) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'character/?page=$page',
      );

      final data = response.data!['results'] as List<dynamic>;

      final characters = data
          .map((e) => CharacterModel.fromMap(e as Map<String, dynamic>))
          .toList();

      return characters;
    } catch (e) {
      if (e is DioException) {
        throw Failure(
          message: e.message,
        );
      }
      rethrow;
    }
  }

  @override
  Future<CharacterModel> getSingleCharacter(int id) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://rickandmortyapi.com/api/character/$id',
      );

      final character = CharacterModel.fromMap(response.data!);
      return character;
    } catch (e) {
      if (e is DioException) {
        throw Failure(
          message: e.message,
        );
      }
      rethrow;
    }
  }

  @override
  Future<List<CharacterModel>> searchByName(String name) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://rickandmortyapi.com/api/character/?name=$name',
      );

      final data = response.data!['results'] as List<dynamic>;
      final characters = data
          .map((e) => CharacterModel.fromMap(e as Map<String, dynamic>))
          .toList();

      return characters;
    } catch (e) {
      if (e is DioException) {
        throw Failure(
          message: e.message,
        );
      }
      rethrow;
    }
  }
}
