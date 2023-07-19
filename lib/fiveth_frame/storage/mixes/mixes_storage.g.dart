// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixes_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMixItemAdapter extends TypeAdapter<_HiveMixItem> {
  @override
  final int typeId = 5;

  @override
  _HiveMixItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _HiveMixItem(
      volume: fields[0] as double,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _HiveMixItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.volume)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMixItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveMixAdapter extends TypeAdapter<_HiveMix> {
  @override
  final int typeId = 6;

  @override
  _HiveMix read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _HiveMix(
      name: fields[0] as String,
      music: fields[1] as _HiveMixItem,
      sounds: (fields[2] as List).cast<_HiveMixItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, _HiveMix obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.music)
      ..writeByte(2)
      ..write(obj.sounds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMixAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
