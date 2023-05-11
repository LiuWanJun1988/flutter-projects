import 'package:json_annotation/json_annotation.dart';

import 'species.dart';
import 'version_group_detail.dart';

part 'move.g.dart';

@JsonSerializable()
class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  Species? move;
  List<VersionGroupDetail>? versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}