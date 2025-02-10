part of 'search_cubit.dart';

enum SearchStatus {
  initial(),
  success(),
  failure(),
  loading();

  bool get isInitial => this == SearchStatus.initial;
  bool get isSuccess => this == SearchStatus.success;
  bool get isFailure => this == SearchStatus.failure;
  bool get isLoading => this == SearchStatus.loading;
}

class SearchState extends Equatable {
  const SearchState({
    required this.characters,
    required this.query,
    required this.status,
    required this.failure,
  });

  SearchState.initial()
      : characters = [],
        query = '',
        status = SearchStatus.initial,
        failure = Failure.empty();

  final List<Character> characters;
  final String query;
  final SearchStatus status;
  final Failure failure;

  SearchState copyWith({
    List<Character>? characters,
    String? query,
    int? page,
    Failure? failure,
    SearchStatus? status,
  }) {
    return SearchState(
      characters: characters ?? this.characters,
      query: query ?? this.query,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object> get props => [characters, query, status, failure];
}
