// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeModel _$JokeModelFromJson(Map<String, dynamic> json) => JokeModel(
      json['categories'] as List<dynamic>,
      DateTime.parse(json['created_at'] as String),
      json['icon_url'] as String,
      json['id'] as String,
      DateTime.parse(json['updated_at'] as String),
      json['url'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$JokeModelToJson(JokeModel instance) => <String, dynamic>{
      'categories': instance.categories,
      'created_at': instance.created_at.toIso8601String(),
      'icon_url': instance.icon_url,
      'id': instance.id,
      'updated_at': instance.updated_at.toIso8601String(),
      'url': instance.url,
      'value': instance.value,
    };
