import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/entities/favorite.dart';
import 'package:rickandmorty/domain/repositories/favorites_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required this.repository}) : super(FavoritesState.initial());

  final FavoritesRepository repository;

  Future<void> init() async {
    emit(state.copyWith(status: FavoritesStatus.loading));
    final (failure, response) = await repository.getFavorites();

    if (failure != null) {
      emit(
        state.copyWith(
          failure: failure,
          status: FavoritesStatus.failure,
        ),
      );
    }

    emit(
      state.copyWith(
        favorites: response,
        status: FavoritesStatus.success,
      ),
    );
  }

  Future<void> removeFavorite(int id) async {
    emit(state.copyWith(status: FavoritesStatus.loading));

    final (failure, response) = await repository.removeFavorite(id);

    if (failure != null) {
      emit(
        state.copyWith(
          failure: failure,
          status: FavoritesStatus.failure,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        favorites:
            state.favorites.where((element) => element.id != id).toList(),
        status: FavoritesStatus.success,
      ),
    );
  }

  Future<void> addFavorite(Character character) async {
    emit(state.copyWith(status: FavoritesStatus.loading));

    final favorite = Favorite(
      character: character,
      id: character.id,
      date: DateTime.now(),
    );

    final (failure, response) = await repository.addFavorite(favorite);

    if (failure != null) {
      emit(
        state.copyWith(
          failure: failure,
          status: FavoritesStatus.failure,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        favorites: [...state.favorites, favorite],
        status: FavoritesStatus.success,
      ),
    );
  }
}
