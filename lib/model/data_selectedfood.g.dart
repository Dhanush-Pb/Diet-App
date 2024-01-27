// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_selectedfood.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedfooditemAdapter extends TypeAdapter<Selectedfooditem> {
  @override
  final int typeId = 6;

  @override
  Selectedfooditem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Selectedfooditem(
      fields[0] as Fooditem,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Selectedfooditem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fooditem)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedfooditemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
