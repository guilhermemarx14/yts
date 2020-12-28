import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:yts/models/Data.dart';

part 'Body.g.dart';

@JsonSerializable()
class Body {
  Data data;

  Body({this.data});

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
  Map<String, dynamic> toJson() => _$BodyToJson(this);

  static Future<Body> getBody(int id, bool with_images, bool with_cast) async {
    final response = await http.get(
        'https://yts.mx/api/v2/movie_details.json?movie_id=$id&with_images=$with_images&with_cast=$with_cast');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Body.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
