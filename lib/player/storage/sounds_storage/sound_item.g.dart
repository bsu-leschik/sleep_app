// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoundItemAdapter extends TypeAdapter<SoundItem> {
  @override
  final int typeId = 1;

  @override
  SoundItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SoundItem(
      property: fields[0] as SoundProperties,
      title: fields[2] as String,
      type: fields[1] as SoundType,
    );
  }

  @override
  void write(BinaryWriter writer, SoundItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.property)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoundItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
