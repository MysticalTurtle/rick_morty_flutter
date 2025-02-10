import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/data/datasources/remote/remote_character_ds.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/repositories/character_repository.dart';

class CharacterRepositoryI extends CharacterRepository {
  CharacterRepositoryI({
    required this.remoteDS,
  });

  final RemoteCharacterDS remoteDS;

  @override
  Future<(Failure?, List<Character>?)> getCharacterPage(int page) async {
    try {
      final charactersModel = await remoteDS.getCharacterPage(page);
      final jsonList = charactersModel.map((e) => e.toMap()).toList();
      final charactersEntities = jsonList.map(Character.fromMap).toList();
      return (null, charactersEntities);
    } catch (e) {
      if (e is Failure) {
        return (e, null);
      }
      return (const Failure(message: 'Error desconocido'), null);
    }
  }

  @override
  Future<(Failure?, Character?)> getSingleCharacter(int id) async {
    try {
      final characterModel = await remoteDS.getSingleCharacter(id);
      final characterEntity = Character.fromMap(characterModel.toMap());
      return (null, characterEntity);
    } catch (e) {
      if (e is Failure) {
        return (e, null);
      }
      return (const Failure(message: 'Error desconocido'), null);
    }
  }

  @override
  Future<(Failure?, List<Character>?)> searchByName(String name) async {
    try {
      final charactersModel = await remoteDS.searchByName(name);
      final jsonList = charactersModel.map((e) => e.toMap()).toList();
      final charactersEntities = jsonList.map(Character.fromMap).toList();
      return (null, charactersEntities);
    } catch (e) {
      if (e is Failure) {
        return (e, null);
      }
      return (const Failure(message: 'Error desconocido'), null);
    }
  }
}
