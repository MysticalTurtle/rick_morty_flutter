import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/repositories/character_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.repository}) : super(SearchState.initial());

  final CharacterRepository repository;

  Future<void> clear() async {
    emit(
      state.copyWith(
        status: SearchStatus.initial,
        characters: [],
        query: '',
      ),
    );
  }

  Future<void> search(String name) async {
    emit(state.copyWith(status: SearchStatus.initial));
    await Future<void>.delayed(Duration.zero);
    emit(state.copyWith(status: SearchStatus.loading));

    final (failure, response) = await repository.searchByName(name);

    if (failure != null) {
      emit(
        state.copyWith(
          failure: failure,
          status: SearchStatus.failure,
        ),
      );
    }

    emit(
      state.copyWith(
        characters: response,
        status: SearchStatus.success,
      ),
    );
  }
}
