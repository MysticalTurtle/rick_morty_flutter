import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<(Failure?, List<Character>?)> getCharacterPage(int page);
  Future<(Failure?, Character?)> getSingleCharacter(int id);
  Future<(Failure?, List<Character>?)> searchByName(String name);
}
