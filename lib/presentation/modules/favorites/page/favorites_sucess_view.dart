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
            return GridView.count(
              crossAxisCount: state.favorites.length,
              children: List.generate(
                state.favorites.length,
                (index) {
                  final favorite = state.favorites[index];
                  return FavoriteCard(favorite: favorite);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
