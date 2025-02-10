import 'package:equatable/equatable.dart';
import 'package:rickandmorty/domain/entities/character.dart';

class Favorite extends Equatable{
  const Favorite({
    required this.id,
    required this.character,
    required this.date,
  });

  factory Favorite.fromMap(Map<String, dynamic> json) => Favorite(
        id: json['id'] as int? ?? 0,
        character: Character.fromMap(json['character'] as Map<String, dynamic>),
        date: DateTime.parse(json['date'] as String? ?? ''),
      );

  final int id;
  final Character character;
  final DateTime date;

  Favorite copyWith({
    int? id,
    Character? character,
    DateTime? date,
  }) =>
      Favorite(
        id: id ?? this.id,
        character: character ?? this.character,
        date: date ?? this.date,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'character': character.toMap(),
        'date': date.toIso8601String(),
      };
  
  @override
  List<Object?> get props => [id, character, date];
}
