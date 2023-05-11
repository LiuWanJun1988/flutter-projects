import 'package:json_annotation/json_annotation.dart';

part 'official_artwork.g.dart';

@JsonSerializable()
class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  String? frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => _$OfficialArtworkFromJson(json);

}