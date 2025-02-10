import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/domain/entities/favorite.dart';
import 'package:rickandmorty/presentation/modules/characters/widgets/character_details_page.dart';
import 'package:rickandmorty/presentation/modules/favorites/cubit/favorites_cubit.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({required this.favorite, super.key});

  final Favorite favorite;

  Widget build(BuildContext context) {
    final character = favorite.character;
    const borderRadious = 16.0;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<FavoritesCubit>(),
              child: CharacterDetailsPage(
                character: character,
              ),
            ),
          ),
        );
      },
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(borderRadious),
                  topRight: Radius.circular(borderRadious),
                ),
                child: Hero(
                  tag: character.id,
                  child: CachedNetworkImage(
                    imageUrl: character.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(character.name),
            ),
          ],
        ),
      ),
    );
  }
}
