import 'package:json_annotation/json_annotation.dart';

import '../other.dart';
import '../versions.dart';

part 'sprites.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

}