import 'package:json_annotation/json_annotation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'Actor.g.dart';

@JsonSerializable()
class Actor {
  String name;
  String caracter_name;
  String url_small_image;
  String imdb_code;

  Actor({this.name, this.caracter_name, this.url_small_image, this.imdb_code});

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
  Map<String, dynamic> toJson() => _$ActorToJson(this);
}
