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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: character.id,
            child: CachedNetworkImage(
              imageUrl: character.image,
              fit: BoxFit.cover,
            ),
          ),
          InfoItem(title: 'ID:', value: character.id.toString()),
          InfoItem(title: 'Nombre:', value: character.name),
          InfoItem(
            title: 'Estado:',
            value: character.status,
          ),
          InfoItem(title: 'Especie:', value: character.species),
          if (character.type.isNotEmpty) Text('Tipo: ${character.type}'),
          InfoItem(title: 'Género:', value: character.gender),
          InfoItem(title: 'Origen:', value: character.origin.name),
          InfoItem(title: 'Ubicación actual', value: character.location.name),
          InfoItem(
            title: 'Aparece en',
            value: '${character.episode.length} episodios',
          ),
          InfoItem(title: 'Creado el', value: character.created.toString()),
        ],
      ),
      floatingActionButton: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final isFavorite =
              state.favorites.any((element) => element.id == character.id);
          return FloatingActionButton(
            heroTag: null,
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

class InfoItem extends StatelessWidget {
  const InfoItem({required this.title, required this.value, super.key});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
