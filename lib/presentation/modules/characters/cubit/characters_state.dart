part of 'characters_cubit.dart';

enum CharactersStatus {
  initial(),
  success(),
  failure(),
  loading();

  bool get isInitial => this == CharactersStatus.initial;
  bool get isSuccess => this == CharactersStatus.success;
  bool get isFailure => this == CharactersStatus.failure;
  bool get isLoading => this == CharactersStatus.loading;
}

class CharactersState extends Equatable {
  const CharactersState({
    required this.characters,
    required this.page,
    required this.status,
    required this.failure,
  });

  CharactersState.initial()
      : characters = [],
        page = 0,
        status = CharactersStatus.initial,
        failure = Failure.empty();

  final List<Character> characters;
  final int page;
  final CharactersStatus status;
  final Failure failure;

  CharactersState copyWith({
    List<Character>? characters,
    int? page,
    Failure? failure,
    CharactersStatus? status,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      page: page ?? this.page,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object> get props => [characters, page, status, failure];
}
