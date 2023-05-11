// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionDetail _$VersionDetailFromJson(Map<String, dynamic> json) =>
    VersionDetail(
      rarity: json['rarity'] as int?,
      version: json['version'] == null
          ? null
          : Species.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionDetailToJson(VersionDetail instance) =>
    <String, dynamic>{
      'rarity': instance.rarity,
      'version': instance.version,
    };
