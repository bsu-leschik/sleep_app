// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicItemAdapter extends TypeAdapter<MusicItem> {
  @override
  final int typeId = 4;

  @override
  MusicItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicItem(
      info: fields[3] as String,
      title: fields[0] as String,
      property: fields[1] as SoundProperties,
      imageRoute: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MusicItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.property)
      ..writeByte(2)
      ..write(obj.imageRoute)
      ..writeByte(3)
      ..write(obj.info);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
