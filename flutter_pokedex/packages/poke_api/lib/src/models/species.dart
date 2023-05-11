import 'package:json_annotation/json_annotation.dart';

part 'species.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Species {
  Species({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
}