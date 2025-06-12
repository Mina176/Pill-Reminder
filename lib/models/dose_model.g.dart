// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoseModelAdapter extends TypeAdapter<DoseModel> {
  @override
  final int typeId = 0;

  @override
  DoseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoseModel(
      remind: fields[6] as bool,
      medName: fields[0] as String,
      form: fields[1] as int,
      dose: fields[2] as int,
      food: fields[3] as int,
      duration: fields[4] as int,
      time: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DoseModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.medName)
      ..writeByte(1)
      ..write(obj.form)
      ..writeByte(2)
      ..write(obj.dose)
      ..writeByte(3)
      ..write(obj.food)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.remind);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
