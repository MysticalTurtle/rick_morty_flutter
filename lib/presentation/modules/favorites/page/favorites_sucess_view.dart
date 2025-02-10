import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/presentation/modules/favorites/cubit/favorites_cubit.dart';
import 'package:rickandmorty/presentation/modules/favorites/widgets/favorite_card.dart';

class FavoritesSucessView extends StatelessWidget {
  const FavoritesSucessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Center(
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state.favorites.isEmpty) {
              return const Text('No hay favoritos');
            }
            return GridView.builder(
              itemCount: state.favorites.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final character = state.favorites[index].character;
                return FavoriteCard(character: character);
              },
            );
          },
        ),
      ),
    );
  }
}
