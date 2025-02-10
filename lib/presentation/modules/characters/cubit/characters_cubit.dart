import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/repositories/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.repository})
      : super(CharactersState.initial());

  final CharacterRepository repository;

  Future<void> init() async {
    emit(state.copyWith(status: CharactersStatus.loading));
    final (failure, response) = await repository.getCharacterPage(1);

    if (failure != null) {
      emit(
        state.copyWith(
          page: 0,
          failure: failure,
          status: CharactersStatus.failure,
        ),
      );
    }

    emit(
      state.copyWith(
        page: 1,
        characters: response,
        status: CharactersStatus.success,
      ),
    );
  }

  Future<void> changePage(int page) async {
    emit(state.copyWith(status: CharactersStatus.initial));
    await Future<void>.delayed(Duration.zero);
    emit(state.copyWith(status: CharactersStatus.loading));

    final (failure, response) = await repository.getCharacterPage(page);

    if (failure != null) {
      emit(
        state.copyWith(
          failure: failure,
          status: CharactersStatus.failure,
        ),
      );
    }

    emit(
      state.copyWith(
        characters: response,
        page: page,
        status: CharactersStatus.success,
      ),
    );
  }
}
