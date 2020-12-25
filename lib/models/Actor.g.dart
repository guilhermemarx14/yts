// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return Actor(
    name: json['name'] as String,
    caracter_name: json['caracter_name'] as String,
    url_small_image: json['url_small_image'] as String,
    imdb_code: json['imdb_code'] as String,
  );
}

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'name': instance.name,
      'caracter_name': instance.caracter_name,
      'url_small_image': instance.url_small_image,
      'imdb_code': instance.imdb_code,
    };
