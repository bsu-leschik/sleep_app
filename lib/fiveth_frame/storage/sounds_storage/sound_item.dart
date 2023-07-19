import 'package:hive/hive.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_item_widget.dart';

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

  const SoundItem({
    required this.property,
    required this.title,
    required this.type,
  });

  SoundItem.fromWidget(SoundItemWidget widget)
      : property = widget.property,
        type = widget.type,
        title = widget.title;
}
