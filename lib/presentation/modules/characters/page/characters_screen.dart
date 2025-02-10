import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/widgets/loading_page.dart';
import 'package:rickandmorty/presentation/modules/characters/cubit/characters_cubit.dart';
import 'package:rickandmorty/presentation/modules/characters/widgets/characters_failure_view.dart';
import 'package:rickandmorty/presentation/modules/characters/widgets/characters_sucess_view.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return switch (state.status) {
          (CharactersStatus.failure) => CharactersFailureView(
              failure: state.failure,
            ),
          (CharactersStatus.loading) => const LoadingPage(),
          (_) => const CharactersSucessView(),
        };
      },
    );
  }
}
