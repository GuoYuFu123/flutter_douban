import 'package:json_annotation/json_annotation.dart';

part 'suggest.g.dart';

@JsonSerializable()
class Suggest {
  final String episode;
  final String img;
  final String title;
  final String url;
  final String type;
  final String year;
  final String sub_title;
  final String id;

  Suggest(
      {this.episode,
      this.id,
      this.img,
      this.sub_title,
      this.title,
      this.type,
      this.url,
      this.year});

  factory Suggest.fromJson(Map<String, dynamic> json) =>
      _$SuggestFromJson(json);
  Map<String, dynamic> toJson() => _$SuggestToJson(this);
}
