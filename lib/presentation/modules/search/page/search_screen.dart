import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/widgets/loading_page.dart';
import 'package:rickandmorty/presentation/modules/search/cubit/search_cubit.dart';
import 'package:rickandmorty/presentation/modules/search/widgets/search_failure_view.dart';
import 'package:rickandmorty/presentation/modules/search/widgets/search_sucess_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return switch (state.status) {
          (SearchStatus.failure) => SearchFailureView(
              failure: state.failure,
            ),
          (SearchStatus.loading) => const LoadingPage(),
          (_) => const SearchSucessView(),
        };
      },
    );
  }
}
