import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:number_pagination/number_pagination.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:rickandmorty/presentation/modules/characters/cubit/characters_cubit.dart';
import 'package:rickandmorty/presentation/modules/characters/widgets/character_card.dart';

class CharactersSucessView extends StatefulWidget {
  const CharactersSucessView({super.key});

  @override
  State<CharactersSucessView> createState() => _CharactersSucessViewState();
}

class _CharactersSucessViewState extends State<CharactersSucessView> {
  final NumberPaginatorController _controller = NumberPaginatorController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state.characters.isEmpty) {
            return const Center(
              child: Text('No hay personajes para mostrar'),
            );
          }
          return Column(
            children: [
              // NumberPagination(
              //   onPageChanged: (int pageNumber) {
              //     context.read<CharactersCubit>().changePage(pageNumber);
              //   },
              //   visiblePagesCount: 5,
              //   totalPages: 42,
              //   currentPage: state.page,
              //   enableInteraction: true,
              //   buttonRadius: 8,
              // ),
              NumberPaginator(
                // controller: _controller,
                // by default, the paginator shows numbers as center content
                initialPage: state.page - 1,
                numberPages: 42,
                onPageChange: (int index) {
                  context.read<CharactersCubit>().changePage(index + 1);
                  // _controller.currentPage = index;
                },
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
            ],
          );
        },
      ),
    );
  }
}
