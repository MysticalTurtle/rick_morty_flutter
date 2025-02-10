import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/presentation/modules/search/cubit/search_cubit.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({this.requestFocus = false, super.key});

  final bool requestFocus;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    if (widget.requestFocus) _focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Buscar personaje',
        prefixIcon: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            _controller.clear();
            context.read<SearchCubit>().clear();
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      onSubmitted: (query) {
        context.read<SearchCubit>().search(query);
        FocusScope.of(context).unfocus();
      },
    );
  }
}
