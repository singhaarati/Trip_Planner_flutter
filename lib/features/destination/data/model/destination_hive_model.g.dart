// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DestinationHiveModelAdapter extends TypeAdapter<DestinationHiveModel> {
  @override
  final int typeId = 1;

  @override
  DestinationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DestinationHiveModel(
      destinationId: fields[0] as String?,
      name: fields[1] as String,
      location: fields[2] as String,
      picture: fields[3] as String,
      price: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DestinationHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.destinationId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.picture)
      ..writeByte(4)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DestinationHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
