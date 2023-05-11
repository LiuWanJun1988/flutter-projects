// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_I.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationI _$GenerationIFromJson(Map<String, dynamic> json) => GenerationI(
      redBlue: json['redBlue'] == null
          ? null
          : RedBlue.fromJson(json['redBlue'] as Map<String, dynamic>),
      yellow: json['yellow'] == null
          ? null
          : RedBlue.fromJson(json['yellow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationIToJson(GenerationI instance) =>
    <String, dynamic>{
      'redBlue': instance.redBlue,
      'yellow': instance.yellow,
    };
