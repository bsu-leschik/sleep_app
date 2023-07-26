// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_music_bar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoundTypeAdapter extends TypeAdapter<SoundType> {
  @override
  final int typeId = 3;

  @override
  SoundType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SoundType.music;
      case 1:
        return SoundType.nature;
      case 2:
        return SoundType.urban;
      case 3:
        return SoundType.animals;
      case 4:
        return SoundType.whiteNoise;
      case 5:
        return SoundType.home;
      case 6:
        return SoundType.baby;
      default:
        return SoundType.music;
    }
  }

  @override
  void write(BinaryWriter writer, SoundType obj) {
    switch (obj) {
      case SoundType.music:
        writer.writeByte(0);
        break;
      case SoundType.nature:
        writer.writeByte(1);
        break;
      case SoundType.urban:
        writer.writeByte(2);
        break;
      case SoundType.animals:
        writer.writeByte(3);
        break;
      case SoundType.whiteNoise:
        writer.writeByte(4);
        break;
      case SoundType.home:
        writer.writeByte(5);
        break;
      case SoundType.baby:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoundTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
