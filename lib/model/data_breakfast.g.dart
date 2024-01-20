// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_breakfast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreakfastModelAdapter extends TypeAdapter<BreakfastModel> {
  @override
  final int typeId = 1;

  @override
  BreakfastModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreakfastModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    )..imagepath = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, BreakfastModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.ingredients)
      ..writeByte(2)
      ..write(obj.prepration)
      ..writeByte(3)
      ..write(obj.imagepath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreakfastModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
