import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/presentation/modules/favorites/cubit/favorites_cubit.dart';

class FavoritesFailureView extends StatelessWidget {
  const FavoritesFailureView({required this.failure, super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(failure.message ?? 'Error desconocido'),
          ElevatedButton(
            onPressed: () => context.read<FavoritesCubit>().init(),
            child: const Text('Intentarlo otra vez'),
          ),
        ],
      ),
    );
  }
}
