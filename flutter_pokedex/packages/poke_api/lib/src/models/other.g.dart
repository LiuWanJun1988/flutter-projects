// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Other _$OtherFromJson(Map<String, dynamic> json) => Other(
      dreamWorld: json['dreamWorld'] == null
          ? null
          : DreamWorld.fromJson(json['dreamWorld'] as Map<String, dynamic>),
      home: json['home'] == null
          ? null
          : Home.fromJson(json['home'] as Map<String, dynamic>),
      officialArtwork: json['officialArtwork'] == null
          ? null
          : OfficialArtwork.fromJson(
              json['officialArtwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherToJson(Other instance) => <String, dynamic>{
      'dreamWorld': instance.dreamWorld,
      'home': instance.home,
      'officialArtwork': instance.officialArtwork,
    };
