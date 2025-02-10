import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/injection_container.dart';
import 'package:rickandmorty/presentation/modules/search/cubit/search_cubit.dart';
import 'package:rickandmorty/presentation/modules/search/page/search_screen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(repository: sl())..clear(),
      child: const SearchScreen(),
    );
  }
}
