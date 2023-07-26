// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_property.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoundPropertiesAdapter extends TypeAdapter<SoundProperties> {
  @override
  final int typeId = 2;

  @override
  SoundProperties read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SoundProperties.locked;
      case 1:
        return SoundProperties.unlocked;
      case 2:
        return SoundProperties.favorite;
      default:
        return SoundProperties.locked;
    }
  }

  @override
  void write(BinaryWriter writer, SoundProperties obj) {
    switch (obj) {
      case SoundProperties.locked:
        writer.writeByte(0);
        break;
      case SoundProperties.unlocked:
        writer.writeByte(1);
        break;
      case SoundProperties.favorite:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoundPropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
