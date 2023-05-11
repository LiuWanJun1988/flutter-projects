// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      move: json['move'] == null
          ? null
          : Species.fromJson(json['move'] as Map<String, dynamic>),
      versionGroupDetails: (json['versionGroupDetails'] as List<dynamic>?)
          ?.map((e) => VersionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'move': instance.move,
      'versionGroupDetails': instance.versionGroupDetails,
    };
