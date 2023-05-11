import 'package:json_annotation/json_annotation.dart';

import 'species.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Species? stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

}