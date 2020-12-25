import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:yts/models/Movie.dart';

part 'Data.g.dart';

@JsonSerializable()
class Data {
  Movie movie;

  Data({this.movie});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
