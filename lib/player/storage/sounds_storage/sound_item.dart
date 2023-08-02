import 'package:hive/hive.dart';
import 'package:sleep_app/player/music_chooser/items/sound_item_widget.dart';

import '../../music_chooser/items/sound_property.dart';
import '../../music_chooser/music_types_bar/choose_music_bar_model.dart';

part 'sound_item.g.dart';

@HiveType(typeId: 1)
class SoundItem {
  @HiveField(0)
  final SoundProperties property;
  @HiveField(1)
  final SoundType type;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String info;

  const SoundItem({
    required this.property,
    required this.title,
    required this.type,
    required this.info,
  });

  SoundItem.fromWidget(SoundItemWidget widget)
      : property = widget.property,
        type = widget.type,
        title = widget.title,
        info = widget.info;
}
