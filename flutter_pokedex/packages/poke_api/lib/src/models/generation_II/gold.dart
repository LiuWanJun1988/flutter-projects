import 'package:json_annotation/json_annotation.dart';

part 'gold.g.dart';

@JsonSerializable()
class Gold {
  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);
}