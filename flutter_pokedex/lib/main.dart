import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/pokemon_bloc_observer.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

import 'app.dart';

void main() {
  Bloc.observer = PokemonBlocObserver();
  runApp(App(
    pokemonRepository: PokemonRepository(),
  ));
}