// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_III.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationIii _$GenerationIiiFromJson(Map<String, dynamic> json) =>
    GenerationIii(
      emerald: json['emerald'] == null
          ? null
          : Emerald.fromJson(json['emerald'] as Map<String, dynamic>),
      fireredLeafgreen: json['fireredLeafgreen'] == null
          ? null
          : Gold.fromJson(json['fireredLeafgreen'] as Map<String, dynamic>),
      rubySapphire: json['rubySapphire'] == null
          ? null
          : Gold.fromJson(json['rubySapphire'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationIiiToJson(GenerationIii instance) =>
    <String, dynamic>{
      'emerald': instance.emerald,
      'fireredLeafgreen': instance.fireredLeafgreen,
      'rubySapphire': instance.rubySapphire,
    };
