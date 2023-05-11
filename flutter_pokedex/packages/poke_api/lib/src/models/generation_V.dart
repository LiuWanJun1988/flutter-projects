import 'package:json_annotation/json_annotation.dart';

import 'generation_IV/sprites.dart';

part 'generation_V.g.dart';

@JsonSerializable()
class GenerationV {
  GenerationV({
    this.blackWhite,
  });

  Sprites? blackWhite;

  factory GenerationV.fromJson(Map<String, dynamic> json) => _$GenerationVFromJson(json);
}