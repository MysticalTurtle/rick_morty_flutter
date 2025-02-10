import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/core.dart';
import 'package:rickandmorty/presentation/modules/search/cubit/search_cubit.dart';

class SearchFailureView extends StatelessWidget {
  const SearchFailureView({required this.failure, super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(failure.message ?? 'Error desconocido'),
          ElevatedButton(
            onPressed: () {
              final searchCubit = context.read<SearchCubit>();
              searchCubit.search(searchCubit.state.query);
            },
            child: const Text('Intentarlo otra vez'),
          ),
        ],
      ),
    );
  }
}
