// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      name: fields[1] as String,
      age: fields[2] as int,
      targetWeight: fields[3] as double,
      height: fields[4] as double,
      weight: fields[5] as double,
      goal: fields[7] as String,
      sex: fields[6] as String,
      dob: fields[8] as String,
      id: fields[0] as int?,
      calo: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.targetWeight)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.sex)
      ..writeByte(7)
      ..write(obj.goal)
      ..writeByte(8)
      ..write(obj.dob)
      ..writeByte(9)
      ..write(obj.calo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
