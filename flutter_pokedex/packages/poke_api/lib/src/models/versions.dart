import 'package:json_annotation/json_annotation.dart';

import 'generation_I.dart';
import 'generation_II.dart';
import 'generation_III.dart';
import 'generation_IV.dart';
import 'generation_V.dart';
import 'generation_VII.dart';
import 'generation_VII/home.dart';
import 'generation_VIII.dart';

part 'versions.g.dart';

@JsonSerializable()
class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, Home>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  factory Versions.fromJson(Map<String, dynamic> json) => _$VersionsFromJson(json);

}