import 'package:json_annotation/json_annotation.dart';

import 'species.dart';
import 'version_detail.dart';

part 'held_item.g.dart';

@JsonSerializable()
class HeldItem {
  HeldItem({
    this.item,
    this.versionDetails,
  });

  Species? item;
  List<VersionDetail>? versionDetails;

  factory HeldItem.fromJson(Map<String, dynamic> json) => _$HeldItemFromJson(json);
}