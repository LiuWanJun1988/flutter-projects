import 'package:json_annotation/json_annotation.dart';

import 'generation_II/gold.dart';
import 'generation_III/emerald.dart';

part 'generation_III.g.dart';

@JsonSerializable()
class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  Emerald? emerald;
  Gold? fireredLeafgreen;
  Gold? rubySapphire;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => _$GenerationIiiFromJson(json);

}