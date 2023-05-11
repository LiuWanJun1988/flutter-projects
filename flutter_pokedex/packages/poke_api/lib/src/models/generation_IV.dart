import 'package:json_annotation/json_annotation.dart';

import 'generation_IV/sprites.dart';

part 'generation_IV.g.dart';

@JsonSerializable()
class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  Sprites? diamondPearl;
  Sprites? heartgoldSoulsilver;
  Sprites? platinum;

  factory GenerationIv.fromJson(Map<String, dynamic> json) => _$GenerationIvFromJson(json);

}