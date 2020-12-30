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
  )..movies = (json['movies'] as List)
      ?.map((e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'movie': instance.movie,
      'movies': instance.movies,
    };
