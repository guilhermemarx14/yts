// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'],
    url: json['url'] as String,
    imdb_code: json['imdb_code'] as String,
    title: json['title'] as String,
    title_english: json['title_english'] as String,
    title_long: json['title_long'] as String,
    slug: json['slug'] as String,
    year: json['year'],
    rating: (json['rating'] as num)?.toDouble(),
    runtime: json['runtime'],
    genres: (json['genres'] as List)?.map((e) => e as String)?.toList(),
    download_count: json['download_count'],
    like_count: json['like_count'],
    description_intro: json['description_intro'] as String,
    description_full: json['description_full'] as String,
    yt_trailer_code: json['yt_trailer_code'] as String,
    language: json['language'] as String,
    mpa_rating: json['mpa_rating'] as String,
    background_image: json['background_image'] as String,
    background_image_original: json['background_image_original'] as String,
    small_cover_image: json['small_cover_image'] as String,
    medium_cover_image: json['medium_cover_image'] as String,
    large_cover_image: json['large_cover_image'] as String,
    medium_screenshot_image1: json['medium_screenshot_image1'] as String,
    medium_screenshot_image2: json['medium_screenshot_image2'] as String,
    medium_screenshot_image3: json['medium_screenshot_image3'] as String,
    large_screenshot_image1: json['large_screenshot_image1'] as String,
    large_screenshot_image2: json['large_screenshot_image2'] as String,
    large_screenshot_image3: json['large_screenshot_image3'] as String,
    cast: (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Actor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'imdb_code': instance.imdb_code,
      'title': instance.title,
      'title_english': instance.title_english,
      'title_long': instance.title_long,
      'slug': instance.slug,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'download_count': instance.download_count,
      'like_count': instance.like_count,
      'description_intro': instance.description_intro,
      'description_full': instance.description_full,
      'yt_trailer_code': instance.yt_trailer_code,
      'language': instance.language,
      'mpa_rating': instance.mpa_rating,
      'background_image': instance.background_image,
      'background_image_original': instance.background_image_original,
      'small_cover_image': instance.small_cover_image,
      'medium_cover_image': instance.medium_cover_image,
      'large_cover_image': instance.large_cover_image,
      'medium_screenshot_image1': instance.medium_screenshot_image1,
      'medium_screenshot_image2': instance.medium_screenshot_image2,
      'medium_screenshot_image3': instance.medium_screenshot_image3,
      'large_screenshot_image1': instance.large_screenshot_image1,
      'large_screenshot_image2': instance.large_screenshot_image2,
      'large_screenshot_image3': instance.large_screenshot_image3,
      'cast': instance.cast,
    };
