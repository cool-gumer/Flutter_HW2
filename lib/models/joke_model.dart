import 'package:json_annotation/json_annotation.dart';

part 'joke_model.g.dart';

@JsonSerializable()
class JokeModel {
  final List categories;
  final DateTime created_at;
  final String icon_url;
  final String id;
  final DateTime updated_at;
  final String url;
  final String value;

  JokeModel(this.categories,this.created_at,this.icon_url,this.id,this.updated_at,this.url,this.value);
  factory JokeModel.fromJson(Map<String, dynamic> json) => _$JokeModelFromJson(json);
  Map<String, dynamic> toJson() => _$JokeModelToJson(this);
}