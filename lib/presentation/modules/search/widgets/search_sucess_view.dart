import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/widgets/character_card.dart';
import 'package:rickandmorty/core/widgets/loading_page.dart';
import 'package:rickandmorty/presentation/modules/search/cubit/search_cubit.dart';
import 'package:rickandmorty/presentation/modules/search/widgets/search_bar.dart';

class SearchSucessView extends StatelessWidget {
  const SearchSucessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                AppSearchBar(
                  requestFocus: state.status.isInitial,
                ),
                Expanded(
                  child: state.status.isLoading
                      ? const LoadingPage()
                      : state.characters.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (state.status.isSuccess) ...[
                                    Image.asset(
                                      'assets/images/no_results.png',
                                      width: 150,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'No se encontraron coincidencias',
                                    ),
                                  ] else
                                    const Text('Realice una búsqueda'),
                                ],
                              ),
                            )
                          : GridView.builder(
                              itemCount: state.characters.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
      ),
    );
  }
}
