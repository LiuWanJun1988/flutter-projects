import 'package:json_annotation/json_annotation.dart';

import 'generation_VII/dream_world.dart';
import 'generation_VII/home.dart';
import 'official_artwork.dart';

part 'other.g.dart';

@JsonSerializable()
class Other {
  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

}