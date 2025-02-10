import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/injection_container.dart';
import 'package:rickandmorty/presentation/modules/characters/cubit/characters_cubit.dart';
import 'package:rickandmorty/presentation/modules/characters/page/characters_screen.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit(repository: sl())..init(),
      child: const CharactersScreen(),
    );
  }
}
