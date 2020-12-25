// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Body _$BodyFromJson(Map<String, dynamic> json) {
  return Body(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'data': instance.data,
    };
