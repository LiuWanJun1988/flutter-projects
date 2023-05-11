import 'package:json_annotation/json_annotation.dart';

part 'red_blue.g.dart';

@JsonSerializable()
class RedBlue {
  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  factory RedBlue.fromJson(Map<String, dynamic> json) => _$RedBlueFromJson(json);
}