import 'package:flutter/cupertino.dart';

import '../../music_chooser/items/sound_property.dart';
import '../../storage/music_storage/music_storage.dart';
import '../../storage/sounds_storage/sounds_storage.dart';
import 'info_icon.dart';

class MixItemSidebar extends StatelessWidget {
  const MixItemSidebar({
    super.key,
    required this.name,
    required this.trashCallback,
    required this.infoCallback,
    required this.type,
  }) : assert(type == SoundsStorage || type == MusicStorage);

  final String name;
  final Function(BuildContext) trashCallback;
  final Function(BuildContext) infoCallback;
  final Type type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 78,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
          color: Color.fromRGBO(12, 14, 31, 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SoundProperty(name, type, size: SoundPropertySize.big),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: SideIcon(
                  icon: Image(image: AssetImage("assets/images/mix/info.png"))),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: SideIcon(
                  icon:
                      Image(image: AssetImage("assets/images/mix/trash.png"))),
            )
          ],
        ),
      ),
    );
  }
}
