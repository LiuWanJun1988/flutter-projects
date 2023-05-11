// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_VII.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationVii _$GenerationViiFromJson(Map<String, dynamic> json) =>
    GenerationVii(
      icons: json['icons'] == null
          ? null
          : DreamWorld.fromJson(json['icons'] as Map<String, dynamic>),
      ultraSunUltraMoon: json['ultraSunUltraMoon'] == null
          ? null
          : Home.fromJson(json['ultraSunUltraMoon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationViiToJson(GenerationVii instance) =>
    <String, dynamic>{
      'icons': instance.icons,
      'ultraSunUltraMoon': instance.ultraSunUltraMoon,
    };
