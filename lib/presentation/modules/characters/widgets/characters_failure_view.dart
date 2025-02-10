import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/presentation/modules/characters/cubit/characters_cubit.dart';

class CharactersFailureView extends StatelessWidget {
  const CharactersFailureView({required this.failure, super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(failure.message ?? 'Error desconocido'),
          ElevatedButton(
            onPressed: () {
              final homecubit = context.read<CharactersCubit>();
              homecubit.changePage(homecubit.state.page);
            },
            child: const Text('Intentarlo otra vez'),
          ),
        ],
      ),
    );
  }
}
