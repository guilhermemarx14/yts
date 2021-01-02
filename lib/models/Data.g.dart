// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    movie: json['movie'] == null
        ? null
        : Movie.fromJson(json['movie'] as Map<String, dynamic>),
    movie_count: json['movie_count'] as int,
    limit: json['limit'] as int,
    page_number: json['page_number'] as int,
    movies: (json['movies'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'movie': instance.movie,
      'movies': instance.movies,
      'movie_count': instance.movie_count,
      'limit': instance.limit,
      'page_number': instance.page_number,
    };
