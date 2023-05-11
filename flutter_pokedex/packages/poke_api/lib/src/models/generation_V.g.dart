// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_V.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationV _$GenerationVFromJson(Map<String, dynamic> json) => GenerationV(
      blackWhite: json['blackWhite'] == null
          ? null
          : Sprites.fromJson(json['blackWhite'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationVToJson(GenerationV instance) =>
    <String, dynamic>{
      'blackWhite': instance.blackWhite,
    };
