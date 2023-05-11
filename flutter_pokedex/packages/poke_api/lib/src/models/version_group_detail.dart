import 'package:json_annotation/json_annotation.dart';

import 'species.dart';

part 'version_group_detail.g.dart';

@JsonSerializable()
class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  int? levelLearnedAt;
  Species? moveLearnMethod;
  Species? versionGroup;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => _$VersionGroupDetailFromJson(json);
}