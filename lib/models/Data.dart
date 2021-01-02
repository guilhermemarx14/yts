import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:yts/models/Movie.dart';

part 'Data.g.dart';

@JsonSerializable()
class Data {
  Movie movie;
  List<Movie> movies;
  int movie_count;
  int limit;
  int page_number;
  Data(
      {this.movie,
      this.movie_count,
      this.limit,
      this.page_number,
      this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
