import 'dart:convert';

import 'package:poke_api/src/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRequestFailure implements Exception {}

class PokemonNotFoundFailure implements Exception {}

class PokeApiClient {
  PokeApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'pokeapi.co';

  final http.Client _httpClient;

  Future<Pokemon> getPokemon({
    required String name
  }) async {

    final pokemonRequest = Uri.https(_baseUrl, '/api/v2/pokemon/$name');

    final pokemonResponse = await _httpClient.get(pokemonRequest);

    if(pokemonResponse.statusCode != 200) {
      throw PokemonRequestFailure();
    }

    final bodyJson = jsonDecode(pokemonResponse.body) as Map<String, dynamic>;

    if(bodyJson.containsKey('Not found')) {
      throw PokemonNotFoundFailure();
    }

    final pk = Pokemon.fromJson(bodyJson);
    return Pokemon.fromJson(bodyJson);
  }
}