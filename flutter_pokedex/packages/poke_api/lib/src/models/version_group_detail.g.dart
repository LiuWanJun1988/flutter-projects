// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_group_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionGroupDetail _$VersionGroupDetailFromJson(Map<String, dynamic> json) =>
    VersionGroupDetail(
      levelLearnedAt: json['levelLearnedAt'] as int?,
      moveLearnMethod: json['moveLearnMethod'] == null
          ? null
          : Species.fromJson(json['moveLearnMethod'] as Map<String, dynamic>),
      versionGroup: json['versionGroup'] == null
          ? null
          : Species.fromJson(json['versionGroup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGroupDetailToJson(VersionGroupDetail instance) =>
    <String, dynamic>{
      'levelLearnedAt': instance.levelLearnedAt,
      'moveLearnMethod': instance.moveLearnMethod,
      'versionGroup': instance.versionGroup,
    };
