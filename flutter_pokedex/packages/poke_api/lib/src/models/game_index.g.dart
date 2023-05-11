// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameIndex _$GameIndexFromJson(Map<String, dynamic> json) => GameIndex(
      gameIndex: json['gameIndex'] as int?,
      version: json['version'] == null
          ? null
          : Species.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameIndexToJson(GameIndex instance) => <String, dynamic>{
      'gameIndex': instance.gameIndex,
      'version': instance.version,
    };
