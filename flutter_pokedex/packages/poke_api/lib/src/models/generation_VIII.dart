import 'package:json_annotation/json_annotation.dart';

import 'generation_VII/dream_world.dart';

part 'generation_VIII.g.dart';

@JsonSerializable()
class GenerationViii {
  GenerationViii({
    this.icons,
  });

  DreamWorld? icons;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => _$GenerationViiiFromJson(json);

}