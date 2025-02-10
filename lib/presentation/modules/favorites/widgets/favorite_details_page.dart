import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presentation/modules/favorites/cubit/favorites_cubit.dart';

class FavoriteDetailsPage extends StatelessWidget {
  const FavoriteDetailsPage({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'fav${character.id}',
              child: CachedNetworkImage(
                imageUrl: character.image,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
                placeholder: (context, url) => Container(
                  height: 300,
                  color: Colors.grey.shade300,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 100, color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
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
      ),
      floatingActionButton: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final isFavorite =
              state.favorites.any((element) => element.id == character.id);
          return FloatingActionButton(
            backgroundColor: isFavorite ? Colors.red : Colors.grey,
            onPressed: () {
              if (isFavorite) {
                context.read<FavoritesCubit>().removeFavorite(character.id);
              } else {
                context.read<FavoritesCubit>().addFavorite(character);
              }
            },
            child: const Icon(Icons.favorite, color: Colors.white),
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
