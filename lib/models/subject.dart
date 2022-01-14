import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  final String cover;
  final int cover_x;
  final int cover_y;
  final String id;
  final bool is_new;
  final bool palyable;
  final String rate;
  final String title;
  final String url;

  Subject(
      {this.cover,
      this.cover_x,
      this.cover_y,
      this.id,
      this.is_new,
      this.palyable,
      this.rate,
      this.title,
      this.url});

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
