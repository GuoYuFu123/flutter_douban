// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Suggest _$SuggestFromJson(Map<String, dynamic> json) {
  return Suggest(
    episode: json['episode'] as String,
    id: json['id'] as String,
    img: json['img'] as String,
    sub_title: json['sub_title'] as String,
    title: json['title'] as String,
    type: json['type'] as String,
    url: json['url'] as String,
    year: json['year'] as String,
  );
}

Map<String, dynamic> _$SuggestToJson(Suggest instance) => <String, dynamic>{
      'episode': instance.episode,
      'img': instance.img,
      'title': instance.title,
      'url': instance.url,
      'type': instance.type,
      'year': instance.year,
      'sub_title': instance.sub_title,
      'id': instance.id,
    };
