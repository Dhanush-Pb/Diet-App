// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_lunch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LunchMOdelAdapter extends TypeAdapter<LunchMOdel> {
  @override
  final int typeId = 3;

  @override
  LunchMOdel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LunchMOdel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LunchMOdel obj) {
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
      other is LunchMOdelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
