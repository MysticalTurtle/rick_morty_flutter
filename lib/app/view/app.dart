import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/injection_container.dart';
import 'package:rickandmorty/l10n/l10n.dart';
import 'package:rickandmorty/presentation/modules/favorites/cubit/favorites_cubit.dart';
import 'package:rickandmorty/presentation/modules/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => FavoritesCubit(repository: sl())..init(),
        child: const HomePage(),
      ),
    );
  }
}
