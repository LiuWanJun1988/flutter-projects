import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/search/view/favourites_page.dart';
import 'package:flutter_pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:flutter_pokedex/pokemon/pokemon.dart';
import 'package:flutter_pokedex/pokemon/view/pokemon_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage._();

  static Route<String> route(String text){
    return MaterialPageRoute(builder: (_) => const SearchPage._());
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => PokemonCubit(context.read<PokemonRepository>()),
      child: const SearchView(),
    );
  }
}



class SearchView extends StatefulWidget {
  const SearchView({super.key});

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const SearchView());
  }

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose(){
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(FavouritesPage.route());
            },
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                    labelText: 'Pokemon',
                ),
              ),
            ),
          ),
          IconButton(
            key: const Key('searchPage_search_iconButton'),
            icon: const Icon(Icons.search, semanticLabel: 'Submit'),
            onPressed: () {
              context.read<PokemonCubit>().fetchPokemon(_text);
              Navigator.of(context).push(PokemonPage.route());
            },
          )
        ],
      ),
    );
  }
}
