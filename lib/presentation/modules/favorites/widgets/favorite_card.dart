import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/widgets/character_details_page.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presentation/modules/favorites/cubit/favorites_cubit.dart';
import 'package:rickandmorty/presentation/modules/favorites/widgets/favorite_details_page.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    const borderRadius = 16.0;
    
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<FavoritesCubit>(),
              child: FavoriteDetailsPage(
                character: character,
              ),
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              child: Hero(
                tag: 'fav${character.id}',
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  fit: BoxFit.cover,
                  height: 150,
                  placeholder: (context, url) => Container(
                    height: 150,
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 150,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
