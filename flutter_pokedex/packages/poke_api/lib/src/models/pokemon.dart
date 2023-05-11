import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';
import 'game_index.dart';
import 'generation_IV/sprites.dart';
import 'held_item.dart';
import 'move.dart';
import 'species.dart';
import 'stat.dart';
import 'package:poke_api/src/models/pokemon_type.dart';

part 'pokemon.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pokemon {
  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  List<Ability>? abilities;
  int? baseExperience;
  List<Species>? forms;
  List<GameIndex>? gameIndices;
  int? height;
  List<HeldItem>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Move>? moves;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<PokemonType>? types;
  int? weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}