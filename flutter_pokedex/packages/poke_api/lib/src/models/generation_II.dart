import 'package:json_annotation/json_annotation.dart';

import 'generation_II/crystal.dart';
import 'generation_II/gold.dart';

part 'generation_II.g.dart';

@JsonSerializable()
class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => _$GenerationIiFromJson(json);
}