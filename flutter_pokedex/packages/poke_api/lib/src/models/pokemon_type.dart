import 'package:json_annotation/json_annotation.dart';

import 'species.dart';

part 'pokemon_type.g.dart';

@JsonSerializable()
class PokemonType {
  PokemonType({
    this.slot,
    this.type,
  });

  int? slot;
  Species? type;

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);

}
