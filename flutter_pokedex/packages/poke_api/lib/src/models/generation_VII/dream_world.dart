import 'package:json_annotation/json_annotation.dart';

part 'dream_world.g.dart';

@JsonSerializable()
class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  dynamic frontFemale;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => _$DreamWorldFromJson(json);

}