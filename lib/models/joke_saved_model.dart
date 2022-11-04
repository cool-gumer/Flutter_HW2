import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_saved_model.g.dart';

@HiveType(typeId: 0)
class JokeSaved extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String value;

  JokeSaved(this.id,this.url,this.value);

}
