// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAdapter extends TypeAdapter<HiveTestModel> {
  @override
  final int typeId = 0;

  @override
  HiveTestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTestModel(
      id: fields[0] as int,
      title: fields[1] as String,
      words: (fields[2] as List).cast<String>(),
      archived: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTestModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.words)
      ..writeByte(3)
      ..write(obj.archived);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
