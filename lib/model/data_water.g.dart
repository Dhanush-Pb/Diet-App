// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_water.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterintakeModelAdapter extends TypeAdapter<WaterintakeModel> {
  @override
  final int typeId = 8;

  @override
  WaterintakeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterintakeModel(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WaterintakeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.glassconsumed)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterintakeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
