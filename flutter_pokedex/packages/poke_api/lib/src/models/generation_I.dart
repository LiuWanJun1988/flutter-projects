import 'package:json_annotation/json_annotation.dart';

import 'generation_I/red_blue.dart';

part 'generation_I.g.dart';

@JsonSerializable()
class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  RedBlue? redBlue;
  RedBlue? yellow;

  factory GenerationI.fromJson(Map<String, dynamic> json) => _$GenerationIFromJson(json);
}