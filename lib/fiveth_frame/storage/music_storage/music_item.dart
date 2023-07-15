import 'package:hive/hive.dart';

import '../../music_chooser/items/sound_property.dart';

part 'music_item.g.dart';

@HiveType(typeId: 4)
class MusicItem {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final SoundProperties property;
  @HiveField(2)
  final String imageRoute;

  const MusicItem(
      {required this.title, required this.property, required this.imageRoute});
}
