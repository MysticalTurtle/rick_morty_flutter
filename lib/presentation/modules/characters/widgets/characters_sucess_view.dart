import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:rickandmorty/core/widgets/character_card.dart';
import 'package:rickandmorty/presentation/modules/characters/cubit/characters_cubit.dart';
import 'package:rickandmorty/presentation/modules/favorites/cubit/favorites_cubit.dart';
import 'package:rickandmorty/presentation/modules/search/page/search_page.dart';

class CharactersSucessView extends StatelessWidget {
  const CharactersSucessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state.status.isSuccess && state.characters.isEmpty) {
          return const Center(
            child: Text('No hay personajes para mostrar'),
          );
        }
        return Column(
          children: [
            AppBar(
              title: const Text('Rick and Morty'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<FavoritesCubit>(),
                          child: const SearchPage(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: state.characters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final character = state.characters[index];
                  return CharacterCard(character: character);
                },
              ),
            ),
            NumberPaginator(
              initialPage: state.page - 1,
              numberPages: 42,
              onPageChange: (int index) {
                context.read<CharactersCubit>().changePage(index + 1);
                // _controller.currentPage = index;
              },
            ),
          ],
        );
      },
    );
  }
}
