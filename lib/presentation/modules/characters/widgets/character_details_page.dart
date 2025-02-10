import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presentation/modules/favorites/cubit/favorites_cubit.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: character.id,
              child: CachedNetworkImage(
                imageUrl: character.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(character.name),
            Text(character.status),
            Text(character.species),
            Text(character.gender),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final isFavorite =
              state.favorites.any((element) => element.id == character.id);
          return FloatingActionButton(
            onPressed: () {
              if (isFavorite) {
                context.read<FavoritesCubit>().removeFavorite(character.id);
              } else {
                context.read<FavoritesCubit>().addFavorite(character);
              }
            },
            child: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
