// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return Subject(
    cover: json['cover'] as String,
    cover_x: json['cover_x'] as int,
    cover_y: json['cover_y'] as int,
    id: json['id'] as String,
    is_new: json['is_new'] as bool,
    palyable: json['palyable'] as bool,
    rate: json['rate'] as String,
    title: json['title'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'cover': instance.cover,
      'cover_x': instance.cover_x,
      'cover_y': instance.cover_y,
      'id': instance.id,
      'is_new': instance.is_new,
      'palyable': instance.palyable,
      'rate': instance.rate,
      'title': instance.title,
      'url': instance.url,
    };
