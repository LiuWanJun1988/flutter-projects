import 'package:json_annotation/json_annotation.dart';

import 'species.dart';

part 'game_index.g.dart';

@JsonSerializable()
class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });

  int? gameIndex;
  Species? version;

  factory GameIndex.fromJson(Map<String, dynamic> json) => _$GameIndexFromJson(json);
}