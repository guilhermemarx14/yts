import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:yts/models/Actor.dart';
import 'package:yts/models/Data.dart';

import 'Body.dart';

part 'Movie.g.dart';

@JsonSerializable()
class Movie {
  var id;
  String url;
  String imdb_code;
  String title;
  String title_english;
  String title_long;
  String slug;
  var year;
  double rating;
  var runtime;
  List<String> genres;
  var download_count;
  var like_count;
  String description_intro;
  String description_full;
  String yt_trailer_code;
  String language;
  String mpa_rating;
  String background_image;
  String background_image_original;
  String small_cover_image;
  String medium_cover_image;
  String large_cover_image;
  String medium_screenshot_image1;
  String medium_screenshot_image2;
  String medium_screenshot_image3;
  String large_screenshot_image1;
  String large_screenshot_image2;
  String large_screenshot_image3;
  List<Actor> cast;

  Movie(
      {this.id,
      this.url,
      this.imdb_code,
      this.title,
      this.title_english,
      this.title_long,
      this.slug,
      this.year,
      this.rating,
      this.runtime,
      this.genres,
      this.download_count,
      this.like_count,
      this.description_intro,
      this.description_full,
      this.yt_trailer_code,
      this.language,
      this.mpa_rating,
      this.background_image,
      this.background_image_original,
      this.small_cover_image,
      this.medium_cover_image,
      this.large_cover_image,
      this.medium_screenshot_image1,
      this.medium_screenshot_image2,
      this.medium_screenshot_image3,
      this.large_screenshot_image1,
      this.large_screenshot_image2,
      this.large_screenshot_image3,
      this.cast});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  static Future<Movie> getMovieById(int id) async {
    final body = await Body.getBody(id, true, true);

    return body.data.movie;
  }

  static Future<List<Movie>> getLatestMovies() async {
    final body = await Body.getBodyLatestMovies();

    return body.data.movies;
  }
}
