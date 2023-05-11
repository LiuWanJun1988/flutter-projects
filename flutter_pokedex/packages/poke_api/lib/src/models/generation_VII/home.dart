import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

}