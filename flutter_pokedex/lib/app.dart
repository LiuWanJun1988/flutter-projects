import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/pokemon/pokemon.dart';
import 'package:flutter_pokedex/search/view/search_page.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

class App extends StatelessWidget {
  const App({Key? key,
    required this.pokemonRepository,
    }) : super(key: key);

  final PokemonRepository pokemonRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PokemonCubit(pokemonRepository)),
      ],
      child: const MaterialApp(
        home: SearchView(),
      ),
    );
  }
}
