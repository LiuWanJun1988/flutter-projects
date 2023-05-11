import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/pokemon/models/pokemon.dart';
import 'package:pokemon_repository/pokemon_repository.dart' hide Pokemon;


part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit(this._pokemonRepository) : super(const PokemonState());

  final PokemonRepository _pokemonRepository;

  Future<void> fetchPokemon(String? name) async {
    if (name == null || name.isEmpty) return;

    emit(state.copyWith(status:PokemonStatus.loading));

    try{
      final pokemon = Pokemon.fromRepository(
          await _pokemonRepository.getPokemon(name)
      );
      emit(state.copyWith(
          status: PokemonStatus.success,
          pokemon: pokemon
      ));
    } on Exception {
      emit(state.copyWith(status: PokemonStatus.failure));
    }
  }

  Future<void> refreshPokemon() async {
    if(!state.status.isSuccess) return;
    if(state.pokemon == Pokemon.empty) return;
    try {
      final pokemon = Pokemon.fromRepository(await _pokemonRepository.getPokemon(state.pokemon.name!),);

      state.copyWith(
          status: PokemonStatus.success,
          pokemon: pokemon
      );
    } on Exception {
      emit(state);
    }
  }

  Future<void> addFavourite() async {
    if(!state.status.isSuccess) return;
    if(state.pokemon == Pokemon.empty) return;
    try {
      final pokemon = Pokemon.fromRepository(await _pokemonRepository.getPokemon(state.pokemon.name!),);

      final favouritePokemon = pokemon.copyWith(
          id: pokemon.id,
          name: pokemon.name,
          image: pokemon.image,
          isFavourite: true
      );

      _pokemonRepository.addToFavourite(await _pokemonRepository.getPokemon(state.pokemon.name!));

      emit(state.copyWith(
          status: PokemonStatus.success,
          pokemon: favouritePokemon
      ));
    } on Exception {
      emit(state);
    }
  }
}