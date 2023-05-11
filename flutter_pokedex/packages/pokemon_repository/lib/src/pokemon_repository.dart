import 'package:poke_api/poke_api.dart' hide Pokemon;
import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:favourite_pokemon_table/favourite_pokemon_table.dart';

class PokemonRepository{
  PokemonRepository({PokeApiClient? pokeApiClient})
      : _pokeApiClient = pokeApiClient ?? PokeApiClient();

  final PokeApiClient _pokeApiClient;

  Future<Pokemon> getPokemon(String name) async {
    final pokemonAPI = await _pokeApiClient.getPokemon(name: name);

    final pokemon = Pokemon(
        id: pokemonAPI.id,
        name: pokemonAPI.name,
        image: pokemonAPI.sprites?.frontDefault
    );
    return pokemon;
  }

  Future<void> addToFavourite(Pokemon pokemon) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    await databaseHelper.open();
    await databaseHelper.insert(pokemon);
    await databaseHelper.close();
  }

  Future<List<Pokemon>> getFavourites() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    await databaseHelper.open();
    List<Pokemon> favourites = await databaseHelper.getFavourites();
    await databaseHelper.close();
    return favourites;
  }
}