// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_saved_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeSavedAdapter extends TypeAdapter<JokeSaved> {
  @override
  final int typeId = 0;

  @override
  JokeSaved read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JokeSaved(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JokeSaved obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeSavedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
